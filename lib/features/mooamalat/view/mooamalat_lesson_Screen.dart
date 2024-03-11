import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/mooamalat/controller/mooamalat_controller.dart';
class MooamalatLessonScreen extends StatelessWidget {
  MooamalatLessonScreen({required this.courseIndex,required this.lessonIndex ,super.key});
  final int courseIndex;
  final int lessonIndex;
  MooamalatController mooamalatController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${mooamalatController.mooamalatModel.courses![courseIndex].lessons![lessonIndex].title}'),
      ),
        body:
              Container(
                color: AppColors.kPrimaryColor,
                child: Padding(
                    padding: 20.aEdge,
                    child: SingleChildScrollView(child: Text(
                        '${mooamalatController.mooamalatModel.courses![courseIndex].lessons![lessonIndex].body}',
                      style: Styles.textStyle18Golden,
                    ))),
              ),

    );
  }
}
