import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/salah_importance_page.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/widgets/video_palyer_widget.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/styles/text_styles.dart';

class SectionItemHomePageWidget extends StatelessWidget {
  SectionItemHomePageWidget({
    super.key,
    required this.sectionName,
    required this.sectionSubtitle,
    required this.sectionIcon,
    required this.onTap,
    this.isInfo = false,
    this.isVideo = false,
    required this.textInfo,
  });
  final String sectionName;
  final String sectionSubtitle;

  final String sectionIcon;
  final String textInfo;
  final bool isVideo;
  final GestureTapCallback? onTap;
  bool? isInfo;
  @override
  Widget build(BuildContext context) {
    final VideoPlayerController controller =
        VideoPlayerController.asset('assets/video/v1.mp4');
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.kPrimaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: IntrinsicHeight(
          child: Row(children: [
            SizedBox(
                width: 34,
                height: 34,
                child: SvgPicture.asset(
                  sectionIcon,
                  fit: BoxFit.fill,
                )),
            const SizedBox(
              width: 10,
            ),
            const VerticalDivider(
              color: AppColors.kWhiteColor,
              thickness: 1.6,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sectionName,
                    style: Styles.textStyle20Golden
                        .copyWith(color: AppColors.kWhiteColor),
                  ),
                  sectionSubtitle != ''
                      ? Text(
                          sectionSubtitle,
                          style: Styles.textStyle10.copyWith(
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
            if (isInfo != null)
              IconButton(
                onPressed: () {
                  if (isInfo == true) {
                    Get.to(() => const SalahImportancePage());
                  } else {
                    String text = textInfo;
                    // Get.defaultDialog(
                    //     title: 'La importancia de la Purificación en el Islam',
                    //     content: ListView(
                    //       shrinkWrap: true,
                    //       children: [Text(text)],
                    //     ));
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              backgroundColor: AppColors.kWhiteColor,
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text(
                                      "Ok",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.kPrimaryColor),
                                    ))
                              ],
                              content: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Text(
                                        text,
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    isVideo
                                        ? IconButton(
                                            onPressed: () async {
                                              // controller = VideoPlayerController.asset(videoPath);
                                              await controller.initialize();
                                              await Get.generalDialog(
                                                  pageBuilder: (_, __, ___) {
                                                return VideoPlayerWidget(
                                                    controller: controller);
                                              });
                                              controller.dispose();
                                            },
                                            icon: const Icon(Icons.play_arrow),
                                          )
                                        : const SizedBox()
                                  ],
                                ),
                              ));
                        });
                  }
                },
                icon: const Icon(
                  Icons.info_outline,
                  color: AppColors.kGoldenColor,
                ),
              )
          ]),
        ),
      ),
    );
  }
}
