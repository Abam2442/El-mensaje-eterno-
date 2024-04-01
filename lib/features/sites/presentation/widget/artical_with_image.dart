import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/app_bar_custom.dart';
import '../../../../core/constants/app_colors.dart';

class ArticalImageCustom extends StatelessWidget {
  final String dataText;
  final String imageLink;
  const ArticalImageCustom({
    super.key,
    required this.dataText,
    required this.imageLink,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      appBar: const AppBarCustom(title: '').customAppBar(context),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: ListView(children: [
          Image.network(
            imageLink,
          ),
          SelectableText(
            dataText,
            textAlign: TextAlign.start,
            style: const TextStyle(
                fontSize: 18, height: 1.5, fontWeight: FontWeight.bold),
          ),
        ]),
      ),
    );
  }
}
