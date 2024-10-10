import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/constants/reciters_urls.dart';
import 'package:hiwayda_oracion_islamica/core/constants/tafsirs_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/copy_clipboard.dart';
import 'package:hiwayda_oracion_islamica/core/services/audio_service.dart';
import 'package:hiwayda_oracion_islamica/core/services/shared_preferences_service.dart';
import 'package:hiwayda_oracion_islamica/features/quran/domain/entities/ayah_entity.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/quran_controller.dart';

class SurahController extends GetxController {
  static SurahController get instance => Get.find();
  final int? ayaNumber;
  var currentVerse = 1.obs;
  var isSoundPlayed = false.obs;
  var quranController = Get.find<QuranController>();
  var sharedPreferencesService = Get.find<SharedPreferencesService>();
  var currentRandomVerse = 0.obs;
  var selectedReciter = ''.obs;
  final Map<int, GlobalKey> keys = {};
  var isWordRecited = false;
  var isCopyingAyas = false.obs;
  var selectedAyas = RxList<Ayah>();

  ScrollController scrollController = ScrollController();
  final AudioService audioService = Get.find<AudioService>();

  SurahController({required this.ayaNumber});

  @override
  void onInit() {
    super.onInit();
    _setSelectedReciter();
    _setSelectedTafsirs();
    _createKeysForlListItems();
    _navigateToAyaFromSearch(ayaNumber);
    setUrl();
    audioService.setOnFinishedCallback(readCompeleted);
  }

  saveSelectedTafsirs(selectedItems) {
    List<String> tafsirs = [];
    for (var item in selectedItems.keys) {
      if (selectedItems[item] == true) {
        tafsirs.add(item);
      }
    }

    Get.find<QuranController>().updateSelectedTranslator(tafsirs);
  }

  void _navigateToAyaFromSearch(int? ayaNumber) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (ayaNumber != null) {
        double? size = keys[0]?.currentContext?.size?.height;
        if (size != null) {
          await scrollController.animateTo((ayaNumber * size),
              duration: const Duration(seconds: 2), curve: Curves.linear);
          final keyContext = keys[ayaNumber - 1]?.currentContext;
          if (keyContext != null) {
            Scrollable.ensureVisible(
              keyContext,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            );
          }
        }
      }
    });
  }

  void _createKeysForlListItems() {
    for (int i = 0; i < quranController.currentAyat.length; i++) {
      keys[i] = GlobalKey();
    }
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
        '${RecitersUrls.reciters[selectedReciter]}/${quranController.currentSurrah.toString().padLeft(3, '0')}${ayaNumber.toString().padLeft(3, '0')}.mp3');
    audioService.play();
  }

  void _scrollToCurrentVerse() {
    final keyContext = keys[currentVerse.value - 1]?.currentContext;
    if (keyContext != null) {
      Scrollable.ensureVisible(
        keyContext,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> setUrl() async {
    String url =
        '${RecitersUrls.reciters[selectedReciter]}/${quranController.currentSurrah.toString().padLeft(3, '0')}${currentVerse.value.toString().padLeft(3, '0')}.mp3';
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
    isCopyingAyas.value = false;
    selectedAyas.clear();

    setUrl();
  }

  void reciteWord(int ayaNumber, int selectedWordIndex) {
    isWordRecited = true;
    audioService.pause();
    audioService.setUrl(
        '${RecitersUrls.wordsPronunciationUrl}/${quranController.currentSurrah}/${quranController.currentSurrah.toString().padLeft(3, '0')}_${ayaNumber.toString().padLeft(3, '0')}_${(selectedWordIndex + 1).toString().padLeft(3, '0')}.mp3');
    audioService.play();
  }

  void _setSelectedReciter() {
    selectedReciter.value = sharedPreferencesService.getData<String>(
            key: AppKeys.selectedReciter) ??
        RecitersUrls.defaultReciter;
  }

  void _setSelectedTafsirs() {
    bool? firstRun =
        sharedPreferencesService.getData<bool>(key: AppKeys.isFirstRun);
    if (firstRun == null || firstRun == true) {
      var firstTafsir = TafsirKeys.tafsirs.first;
      quranController.selectedTafsirs.add(firstTafsir);
      sharedPreferencesService.setData(key: firstTafsir, value: true);
      sharedPreferencesService.setData(key: AppKeys.isFirstRun, value: false);
    } else {
      TafsirKeys.tafsirs.forEach((tafsir) async {
        bool isSelected =
            sharedPreferencesService.getData<bool>(key: tafsir) ?? false;
        if (isSelected) {
          quranController.selectedTafsirs.add(tafsir);
        }
      });
    }
  }

  void readCompeleted() {
    if (currentRandomVerse > 0 || isWordRecited) {
      currentRandomVerse.value = 0;
      isWordRecited = false;
      setUrl();
      audioService.pause();
    } else {
      if (currentVerse.value < quranController.currentAyat.length) {
        readNextVerse();
      } else {
        audioService.pause();
      }
    }
  }

  String getAyaCopyText(Ayah aya) {
    String tafisrText = '';
    for (var tafsir in quranController.selectedTafsirs) {
      tafisrText +=
          '${'$tafsir\n' + aya.tafsirs[tafsir]}\n __________________________________________________________';
    }
    return "${aya.arabic}\n\n$tafisrText";
  }

  copySelectedAyat() {
    String text = '';
    for (var ayah in selectedAyas) {
      text += getAyaCopyText(ayah);
      text += '\n\n';
      text += '______________________________________________';
    }
    copyToClipboard(text);
    isCopyingAyas.value = false;
    selectedAyas.clear();
  }
}
