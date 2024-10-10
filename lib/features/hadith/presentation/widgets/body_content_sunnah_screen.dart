import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/hadith_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hiwayda_oracion_islamica/features/hadith/presentation/controller/hadith_controller.dart';

import '../../../../core/styles/text_styles.dart';

class BodyContentSunnahScreen extends StatelessWidget {
  final List data;
  const BodyContentSunnahScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 12),
          HadithContainer(hadith: data),
        ],
      ),
    );
  }
}
