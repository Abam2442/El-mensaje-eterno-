import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
