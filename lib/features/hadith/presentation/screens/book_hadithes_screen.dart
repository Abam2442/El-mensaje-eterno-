import 'package:hiwayda_oracion_islamica/features/hadith/presentation/controller/hadith_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/sunnah_hadith_select_sliver_context.dart';

class BookHadithesScreen extends GetView<HadithController> {
  final int index;
  final String webside, name;
  const BookHadithesScreen(this.index, this.webside, this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SunnahBookSelectSliver(index, name),
    );
  }
}
