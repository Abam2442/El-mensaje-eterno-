import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_images.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/services/easy_loader_service.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/copy_button.dart';
import 'package:hiwayda_oracion_islamica/features/salah/model/tahara_lesson_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/styles/text_styles.dart';

class LessonDetailsPage extends StatelessWidget {
  LessonDetailsPage({required this.lessonDetail});

 final LessonDetail lessonDetail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: 16.aEdge,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [

                          Expanded(child: Text(lessonDetail.title, style: Styles.textStyle24Golden)),
                          CopyButton(text: lessonDetail.body.toString())
                        ],
                      ),
                      10.hSize,
                      InkWell(
                        onTap: () {
                          launchURL(lessonDetail.video);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          const   Text(
                              'Click To Watch a Video',
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            5.wSize,
                            Image.asset(AppImages.youtube),
                          ],
                        ),
                      ),
                      10.hSize,
                      SelectableText(lessonDetail.body.toString(), style: TextStyle(color: Colors.white, fontSize: 18))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}
