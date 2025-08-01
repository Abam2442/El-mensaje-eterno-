import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/services/audio_service.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/quran_controller.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/surah_controller.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/surah_screen_widgets/audio_controls_widget.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/surah_screen_widgets/aya_container.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/surah_screen_widgets/basmala_image.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/surah_screen_widgets/tafsirs_picker_widget.dart';

class SurahScreen extends StatefulWidget {
  const SurahScreen({super.key, this.ayaNumber});

  final int? ayaNumber;

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  late final QuranController quranController;
  late final SurahController surrahController;

  @override
  void initState() {
    super.initState();

    if (!Get.isRegistered<AudioService>()) {
      Get.put(AudioService());
    }

    quranController = Get.find<QuranController>();

    surrahController = Get.put(SurahController(ayaNumber: widget.ayaNumber));
  }

  @override
  void dispose() {
    surrahController.scrollController.dispose();
    surrahController.audioService.stop();

    Get.delete<SurahController>();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kWhiteColor,
        iconTheme: const IconThemeData(color: AppColors.kPrimaryColor),
        title: Text(
            quranController.surahs[quranController.currentSurrah - 1].name,
            style: const TextStyle(color: AppColors.kPrimaryColor)),
        actions: [
          IconButton(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.copy_outlined),
                Obx(
                  () => !surrahController.isCopyingAyas.value
                      ? const SizedBox()
                      : Positioned(
                          left: -8,
                          top: -4,
                          child: Container(
                              width: 18,
                              height: 18,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                  color: AppColors.kGreenColor),
                              child: Center(
                                  child: Text(
                                surrahController.selectedAyas.length.toString(),
                                style: const TextStyle(color: AppColors.white),
                              ))),
                        ),
                )
              ],
            ),
            onPressed: () async {
              surrahController.isCopyingAyas.value = true;
            },
          ),
          TafsirsPickerWidget(
            onSave: surrahController.saveSelectedTafsirs,
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                    controller: surrahController.scrollController,
                    itemCount: quranController.currentAyat.length + 1,
                    //to make the next widget render if tafisrs text it big
                    // for auto navigation to work
                    cacheExtent: 3000,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                          child: BasmalaImage(),
                        );
                      }
                      return AyaContainer(
                        key: surrahController.keys[index - 1],
                        number: index,
                        ayah: quranController.currentAyat[index - 1],
                      );
                    }),
              ),
              Obx(() => surrahController.isCopyingAyas.value
                  ? Container(
                      color: AppColors.kWhiteColor,
                      margin: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                surrahController.copySelectedAyat();
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                padding: const EdgeInsets.all(12),
                                decoration: const BoxDecoration(
                                    color: AppColors.kGreenColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                child: const Center(
                                    child: Text(
                                  'copiar Ayah seleccionada',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                )),
                              ),
                            ),
                          ),
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              surrahController.isCopyingAyas.value = false;
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              padding: const EdgeInsets.all(12),
                              decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              child: const Center(
                                  child: Text(
                                'cancelar',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              )),
                            ),
                          )),
                        ],
                      ),
                    )
                  : const SizedBox()),
              const QuranAudioControlsWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
