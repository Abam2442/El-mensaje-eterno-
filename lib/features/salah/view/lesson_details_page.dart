import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_images.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/features/salah/model/tahara_lesson_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/styles/text_styles.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/services/easy_loader_service.dart';

class LessonDetailsPage extends StatelessWidget {
  LessonDetailsPage({required this.lessonDetail});

  LessonDetail lessonDetail;

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
                      Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        children: [
                          Text(lessonDetail.title, style: Styles.textStyle24Golden),
                          IconButton(onPressed:() async {
                            var data = ClipboardData(text:lessonDetail.body.toString());
                            await Clipboard.setData(data);
                            EasyLoaderService.showToast(message: "Copied");
                          },
                            icon: SvgPicture.asset(
                              AppAssets.kCopyIcon,
                            ),)
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
                            Text(
                              'Click To Watch a Video',
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            5.wSize,
                            Image.asset(AppImages.youtube),
                          ],
                        ),
                      ),
                      10.hSize,
                    SelectableText(lessonDetail.body.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 18),
                 //   showCursor: true,
                 //   contextMenuBuilder:(context,editableTextState){
                  //    return AdaptiveTextSelectionToolbar.}
                      )
                    //  Text(lessonDetail.body.toString(), style: TextStyle(color: Colors.white, fontSize: 18))
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
