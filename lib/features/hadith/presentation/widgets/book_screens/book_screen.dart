import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/primary_list_tile.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/data/models/hadith_model.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/book_screens/book_final_screen.dart';

class BookScreen extends StatelessWidget {
  final SunnahHadithModel data;
  const BookScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final titles = data.hadiths.keys.toList();
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.kGoldenColor,
        ),
        backgroundColor: AppColors.kPrimaryColor,
        title: Text(data.bookName,
            style: const TextStyle(color: AppColors.kGoldenColor)),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return PrimaryListTile(
          itemNumber: index + 1,
          es: titles[index],
          ar: '',
          isSaved: false,
          onTap: () {
            Get.to(
              () => BookFinalScreen(
                data: data.hadiths[titles[index]],
              ),
            );
          },
        );
      }),
    );
  }
}
