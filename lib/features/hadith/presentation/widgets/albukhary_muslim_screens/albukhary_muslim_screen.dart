import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/primary_list_tile.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/data/models/hadith_model.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/albukhary_muslim_screens/albikhary_muslim_second_screen.dart';

class AlbukharyMuslimScreen extends StatelessWidget {
  final SunnahHadithModel data;
  const AlbukharyMuslimScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final List titles = data.hadiths.keys.toList();
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.kGoldenColor,
        ),
        title: Text(data.bookName,
            style: const TextStyle(color: AppColors.kGoldenColor)),
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
                  final ref = data.hadiths[titles[index]];
                  print(ref);
                  Get.to(
                    () => AlbikharyMuslimSecondScreen(data: ref),
                  );
                });
          }),
    );
  }
}
