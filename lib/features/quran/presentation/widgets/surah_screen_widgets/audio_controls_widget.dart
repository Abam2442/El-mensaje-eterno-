import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/services/audio_service.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/surah_controller.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/surah_screen_widgets/reciter_picker_widget.dart';

class QuranAudioControlsWidget extends StatelessWidget {
  const QuranAudioControlsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final SurahController surahController = SurahController.instance;
    final AudioService audioService = Get.put(AudioService());
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: AppColors.kGreenColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(() => IconButton(
                    icon: Icon(audioService.isPlaying.value
                        ? Icons.pause
                        : Icons.play_arrow),
                    color: Colors.white,
                    onPressed: () {
                      if (audioService.isPlaying.value) {
                        audioService.pause();
                      } else {
                        audioService.play();
                      }
                    },
                  )),
              IconButton(
                icon: const Icon(Icons.stop),
                color: Colors.white,
                onPressed: () => surahController.stopSound(),
              ),
              Obx(() => audioService.isDownloading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : const SizedBox(
                      width: 20,
                    )),
              Expanded(
                  child: Center(
                      child: Obx(() => Text(
                            '${surahController.currentVerse.value} - ${surahController.quranController.currentAyat.length}',
                            style: const TextStyle(color: Colors.white),
                          )))),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: const ReciterPickerWidget())
            ],
          ),
        ],
      ),
    );
  }
}
