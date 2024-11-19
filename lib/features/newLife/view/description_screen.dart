import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({required this.des, super.key});
  final String des;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Description'),
        ),
      ),
      backgroundColor: AppColors.kPrimaryColor,
      body: SingleChildScrollView(
        child: Padding(
            padding: 10.aEdge,
            child: Text(
              des,
              style: Styles.textStyle18Godlen,
            )),
      ),
    );
  }
}
