import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/newMuslims/controller/newMuslims_controller.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/services/easy_loader_service.dart';
class NewMuslimsNestedTopicsScreen extends StatelessWidget {
  NewMuslimsNestedTopicsScreen({required this.courseIndex,required this.lessonIndex ,super.key, required this.nestedTopicsIndex});
  final int courseIndex;
  final int lessonIndex;
  final int nestedTopicsIndex;
  NewMuslimsController newMuslimsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${newMuslimsController.newMuslimsModel.courses![courseIndex].lessons![lessonIndex].nestedTopics![nestedTopicsIndex].title}'
        ),
        actions: [
          IconButton(onPressed:() async {
            var data = ClipboardData(text:'${newMuslimsController.newMuslimsModel.courses![courseIndex].lessons![lessonIndex].nestedTopics![nestedTopicsIndex].body}');
            await Clipboard.setData(data);
            EasyLoaderService.showToast(message: "Copied");
          },
            icon: SvgPicture.asset(
              AppAssets.kCopyIcon,
            ),)
        ],
      ),
      body:
      SingleChildScrollView(
        child: Container(
          color: AppColors.kPrimaryColor,
          child: Padding(
              padding: 20.aEdge,
              child: SelectableText(
                '${newMuslimsController.newMuslimsModel.courses![courseIndex].lessons![lessonIndex].nestedTopics![nestedTopicsIndex].body}',
                style: Styles.textStyle18Golden,
              )),
        ),
      ),

    );
  }
}
