import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/book_screens/book_hadith_container.dart';

class BookFinalScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  const BookFinalScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BookHadithContainer(
      hadith: data,
    ));
  }
}
