import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/faith/controller/faith_controller.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/services/easy_loader_service.dart';
class FaithLessonScreen extends StatelessWidget {
  FaithLessonScreen({required this.courseIndex,required this.lessonIndex ,super.key});
  final int courseIndex;
  final int lessonIndex;
  FaithController faithController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${faithController.faithModel.courses![courseIndex].lessons![lessonIndex].title}'),
        actions: [
          IconButton(onPressed:() async {
            var data = ClipboardData(text:'${faithController.faithModel.courses![courseIndex].lessons![lessonIndex].body}');
            await Clipboard.setData(data);
            EasyLoaderService.showToast(message: "Copied");
          },
            icon: SvgPicture.asset(
              AppAssets.kCopyIcon,
            ),)
        ],
      ),
        body:
              Container(
                color: AppColors.kPrimaryColor,
                child: Padding(
                    padding: 20.aEdge,
                    child: SingleChildScrollView(child: SelectableText(
                        '${faithController.faithModel.courses![courseIndex].lessons![lessonIndex].body}',
                      style: Styles.textStyle18Golden,
                    ))),
              ),

    );
  }
}
