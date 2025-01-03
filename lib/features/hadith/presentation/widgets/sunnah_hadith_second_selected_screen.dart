import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/primary_list_tile.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/body_content_sunnah_screen.dart';

class SunnahHadithSecondSelectedScreen extends StatelessWidget {
  final List titles;
  final Map<String, dynamic> data;
  const SunnahHadithSecondSelectedScreen(
      {super.key, required this.titles, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(''),
        iconTheme: const IconThemeData(
          color: AppColors.kGoldenColor,
        ),
        backgroundColor: AppColors.kPrimaryColor,
      ),
      body: ListView.builder(
          itemCount: titles.length,
          itemBuilder: (context, index) {
            return PrimaryListTile(
                itemNumber: index + 1,
                es: titles[index],
                ar: '',
                isSaved: false,
                onTap: () {
                  List selectedHadith = data[titles[index]].values.toList();
                  Get.to(
                    () => BodyContentSunnahScreen(
                      data: selectedHadith,
                    ),
                  );
                });
          }),
    );
  }
}
