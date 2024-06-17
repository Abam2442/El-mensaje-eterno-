import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/constants/reciters_urls.dart';
import 'package:hiwayda_oracion_islamica/core/constants/tafsirs_keys.dart';
import 'package:hiwayda_oracion_islamica/core/services/shared_preferences_service.dart';
import 'package:hiwayda_oracion_islamica/core/services/audio_service.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/quran_controller.dart';

class SurahController extends GetxController {
  var currentVerse = 1.obs;
  var isSoundPlayed = false.obs;
  var quranController = Get.find<QuranController>();
  var sharedPreferencesService = Get.find<SharedPreferencesService>();
  var currentRandomVerse = 0.obs;
  var selectedReciter= ''.obs;
  final Map<int, GlobalKey> keys = {};
  var isWordRecited = false;

  late ScrollController scrollController;
  final AudioService audioService = Get.find<AudioService>();

  @override
  void onInit() {
    super.onInit();
     _setSelectedReciter();
    _setSelectedTafsirs();
    audioService.setOnFinishedCallback(readCompeleted);
  }

  

  void readNextVerse() {
    currentVerse.value += 1;
    setUrl();
    audioService.play();
    _scrollToCurrentVerse();
  }

  void readVerse(int ayaNumber) {
    audioService.pause();
    currentRandomVerse.value = ayaNumber;
    audioService.setUrl(
      '${RecitersUrls.reciters[ selectedReciter]}/${quranController.currentSurrah.toString().padLeft(3, '0')}${ayaNumber.toString().padLeft(3, '0')}.mp3'
    );
    audioService.play();
  }

  void _scrollToCurrentVerse() {
    final keyContext = keys[currentVerse.value - 1]?.currentContext;
    if (keyContext != null) {
      Scrollable.ensureVisible(
        keyContext,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> setUrl() async {
    String url = '${RecitersUrls.reciters[selectedReciter]}/${quranController.currentSurrah.toString().padLeft(3, '0')}${currentVerse.value.toString().padLeft(3, '0')}.mp3';
    await audioService.setUrl(url);
  }

  void stopSound() {
    audioService.stop();
    currentVerse.value = 1;
    setUrl();
    _scrollToCurrentVerse();
  
  }

  void resetController() {
    currentVerse.value = 1;
    isSoundPlayed.value = false;
    audioService.isDownloading.value = false;
    currentRandomVerse.value = 0;
    audioService.isPlaying.value = false;
    setUrl();
  }

  void reciteWord(int ayaNumber, int selectedWordIndex) {
    isWordRecited = true;
    audioService.pause();
    audioService.setUrl(
      '${RecitersUrls.wordsPronunciationUrl}/${quranController.currentSurrah}/${quranController.currentSurrah.toString().padLeft(3, '0')}_${ayaNumber.toString().padLeft(3, '0')}_${(selectedWordIndex + 1).toString().padLeft(3, '0')}.mp3'
    );
    audioService.play();
  }

  void _setSelectedReciter() {
    selectedReciter.value =
      sharedPreferencesService.getData<String>(key: AppKeys.selectedReciter)
     ?? RecitersUrls.defaultReciter;
  }

  void _setSelectedTafsirs() {
      
    bool? firstRun = sharedPreferencesService.getData<bool>(key: AppKeys.isFirstRun) ;
    if(firstRun == null || firstRun == true)
    {
      var firstTafsir = TafsirKeys.tafsirs.first;
      quranController.selectedTafsirs.add(firstTafsir);
      sharedPreferencesService.setData(key: firstTafsir, value: true);
      sharedPreferencesService.setData(key: AppKeys.isFirstRun, value: false);

    }
    else
    { 

    TafsirKeys.tafsirs.forEach((tafsir) async {
      
      bool isSelected = sharedPreferencesService.getData<bool>(key: tafsir) ?? false;
      if (isSelected) {
        quranController.selectedTafsirs.add(tafsir);
      }
    });
    }
  }

  void readCompeleted() {
    if(currentRandomVerse > 0 || isWordRecited)
    {
      currentRandomVerse.value = 0;
      isWordRecited = false;
      setUrl();
      audioService.pause();
    }
    else {
      if(currentVerse.value < quranController.currentAyat.length) {
        readNextVerse();
      }
      else
      {
        audioService.pause();
      }
    }
     
  }

 String getAyaCopyText(int number) {
    var aya = quranController.currentAyat[number-1];
    String tafisrText = '';
    for(var tafsir in quranController.selectedTafsirs)
    {
      tafisrText+='${'$tafsir\n' + aya.tafsirs[tafsir]}\n __________________________________________________________';
      
    }  
    return  "${aya.arabic}\n\n$tafisrText";

  }
}
