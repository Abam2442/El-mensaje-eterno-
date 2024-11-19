import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/copy_button.dart';
import 'package:hiwayda_oracion_islamica/features/newMuslims/controller/newMuslims_controller.dart';

class NewMuslimsTopicsScreen extends StatelessWidget {
  NewMuslimsTopicsScreen({
    super.key,
    required this.CategoryIndex,
    required this.Index,
    required this.title,
  });
  final int CategoryIndex;
  final int Index;
  final String title;

  NewMuslimsController newMuslimsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          CopyButton(
              text: newMuslimsController
                      .categorySpModel[CategoryIndex].value![Index].value ??
                  '')
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.kPrimaryColor,
          child: Padding(
              padding: 20.aEdge,
              child: SelectableText(
                '${newMuslimsController.categorySpModel[CategoryIndex].value![Index].value}',
                style: Styles.textStyle18Golden,
              )),
        ),
      ),
    );
  }
}
