import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/hadith_container.dart';
import 'package:flutter/material.dart';

class BodyContentSunnahScreen extends StatelessWidget {
  final List data;
  const BodyContentSunnahScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: HadithContainer(hadith: data),
      ),
    );
  }
}
