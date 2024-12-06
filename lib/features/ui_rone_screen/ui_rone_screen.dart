import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_public_var.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/context_size.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/custom_appbar.dart';
import 'package:hiwayda_oracion_islamica/features/salah/data/model/salah_practical_model.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/salah_practical_page.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/widgets/custom_image_view.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/widgets/video_palyer_widget.dart';
import 'package:video_player/video_player.dart';
import 'controller/ui_rone_controller.dart';

class UiRoneScreen extends StatelessWidget {
  UiRoneScreen({Key? key, required this.title})
      : super(
          key: key,
        );
  UiRoneController controller = Get.put(UiRoneController());
  PageController pageController = PageController();
  late VideoPlayerController videoPlayerController;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: SalahAppbar(title: title),
        backgroundColor: AppColors.yLightGreyColor,
        body: Obx(
          () => controller.isLoading.value
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        width: Get.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () => pageController.previousPage(
                                  duration: const Duration(microseconds: 500),
                                  curve: Curves.bounceIn),
                              child: const Text('Back'),
                            ),
                            Container(
                              padding: 5.aEdge,
                              decoration: BoxDecoration(
                                borderRadius: 20.cBorder,
                                color: AppColors.kGreenColor,
                              ),
                              child: Row(
                                children: [
                                  Obx(
                                    () => Text(
                                      ' ${controller.currentPos.value}',
                                      style: const TextStyle(
                                        color: AppColors.kGoldenColor,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    ' De ',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    ' ${controller.list.length}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () => pageController.nextPage(
                                  duration: const Duration(microseconds: 500),
                                  curve: Curves.bounceIn),
                              child: const Text('Next'),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: PageView.builder(
                          itemCount: controller.list.length,
                          onPageChanged: (page) {
                            controller.currentPos.value = page + 1;
                          },
                          controller: pageController,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        controller.list[index].rakaa.toString(),
                                        style: Styles.textStyle18Green),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  controller.list[index].stepNumber.toString(),
                                  style: Styles.textStyle14Black,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          width: 269.h,
                                          margin: EdgeInsets.only(left: 9.h),
                                          child: Text(
                                            controller.list[index].stepName
                                                .toString(),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: Styles.textStyle18Black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 205.v,
                                          width: 278.h,
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Column(
                                                    children: [
                                                      controller
                                                                  .list[index]
                                                                  .images
                                                                  ?.main
                                                                  ?.mainimage1 !=
                                                              null
                                                          ? CustomImageView(
                                                              imagePath: controller
                                                                  .list[index]
                                                                  .images!
                                                                  .main!
                                                                  .mainimage1!,
                                                              height: 150,
                                                              // width: 100,
                                                              radius:
                                                                  20.cBorder,
                                                            )
                                                          : const Text(
                                                              'jkasksjka'),
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    5.h),
                                                        decoration: BoxDecoration(
                                                            color: AppColors
                                                                .kPrimaryColor,
                                                            borderRadius:
                                                                10.cBorder),
                                                        child: Text(
                                                          "1".tr,
                                                          style: Styles
                                                              .textStyle14White,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  // if ()
                                                  controller
                                                              .list[index]
                                                              .images
                                                              ?.main
                                                              ?.mainimage2 !=
                                                          null
                                                      ? Column(
                                                          children: [
                                                            CustomImageView(
                                                              imagePath: controller
                                                                  .list[index]
                                                                  .images!
                                                                  .main!
                                                                  .mainimage2!,
                                                              height: 150,
                                                              width: 100,
                                                              radius:
                                                                  20.cBorder,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                            ),
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          5.h),
                                                              decoration: BoxDecoration(
                                                                  color: AppColors
                                                                      .kPrimaryColor,
                                                                  borderRadius:
                                                                      10.cBorder),
                                                              child: Text(
                                                                "2".tr,
                                                                style: Styles
                                                                    .textStyle14White,
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      : const SizedBox()
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        IconButton(
                                          icon: const Icon(
                                              Icons.remove_red_eye_outlined),
                                          onPressed: () {
                                            Get.defaultDialog(
                                                title: 'galería',
                                                content:
                                                    swap(SalahPracticalModel(
                                                  video: controller
                                                      .list[index].images!.video
                                                      .toString(),
                                                  image: controller
                                                      .list[index].images!.image
                                                      .toString(),
                                                  image2: controller.list[index]
                                                      .images!.image2
                                                      .toString(),
                                                  image3: controller.list[index]
                                                      .images!.image3
                                                      .toString(),
                                                  image4: controller.list[index]
                                                      .images!.image4
                                                      .toString(),
                                                  image5: controller.list[index]
                                                      .images!.image5
                                                      .toString(),
                                                  image6: controller.list[index]
                                                      .images!.image6
                                                      .toString(),
                                                  video2: controller.list[index]
                                                      .images!.video2
                                                      .toString(),
                                                  rakaa: '',
                                                  stepName: '',
                                                  description: '',
                                                  descriptionaudio: '',
                                                  topics: [],
                                                )));
                                          },
                                        ),
                                        SizedBox(height: 32.v),
                                        IconButton(
                                          icon: const Icon(Icons.info),
                                          onPressed: () {
                                            Get.defaultDialog(
                                              title: 'descripción',
                                              content: SingleChildScrollView(
                                                child: Text(
                                                  controller.list[index].images!
                                                      .description
                                                      .toString(),
                                                ),
                                              ),
                                            );
                                          },
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Expanded(
                                  child: ListView.builder(
                                      itemCount:
                                          controller.list[index].topics!.length,
                                      itemBuilder: (context, i) => _buildTopic(
                                            context,
                                            text: controller.list[index]
                                                .topics![i].transliteration
                                                .toString(),
                                            audioPath: controller
                                                .list[index].topics![i].audio
                                                .toString(),
                                            videoPath: controller
                                                .list[index].topics![i].video
                                                .toString(),
                                            image: AppAssets
                                                .imgUserSpeakSvgrepoCom,
                                          )),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildTopic(
    BuildContext context, {
    required String text,
    required String audioPath,
    required String videoPath,
    required String image,
  }) {
    return Container(
      margin: 5.vEdge,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 33.h,
                vertical: 40.v,
              ),
              decoration: BoxDecoration(
                  color: AppColors.kGoldenColor, borderRadius: 20.cBorder),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(text, style: Styles.textStyle18Black),
                  ),
                  IconButton(
                    icon: const Icon(Icons.spatial_audio),
                    onPressed: () {
                      if (!AppPublicVar.assetsAudioPlayer.playing) {
                        AppPublicVar.assetsAudioPlayer.setAsset(audioPath);
                        AppPublicVar.assetsAudioPlayer.play();
                      } else {
                        AppPublicVar.assetsAudioPlayer.stop();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.remove_red_eye),
            onPressed: () async {
              videoPlayerController = VideoPlayerController.asset(videoPath);
              await videoPlayerController.initialize();
              await Get.generalDialog(pageBuilder: (_, __, ___) {
                return VideoPlayerWidget(controller: videoPlayerController);
              });
              videoPlayerController.dispose();
            },
          )
        ],
      ),
    );
  }

  GestureDetector navigateToPage(IconData icon, Function() controllerFunction) {
    return GestureDetector(
      onTap: controllerFunction,
      child: Container(
        padding: 5.vEdge,
        decoration: BoxDecoration(
          borderRadius: 5.cBorder,
          color: AppColors.kGreenColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            color: AppColors.kGoldenColor,
          ),
        ),
      ),
    );
  }
}
