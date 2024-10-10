import 'dart:io';

import 'package:flutter/services.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/controller/hadith_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/sunnah_widgets/custom_item_card.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class BodyHadithencScreen extends GetView<HadithController> {
  const BodyHadithencScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return CustomItemCard(
        titleSite: 'Test',
        onPress: () async {
          await Permission.manageExternalStorage.request();

          var dir = await getApplicationDocumentsDirectory();
          var file = File("${dir.path}/book1.pdf");
          var data = await rootBundle.load('assets/books/book1.pdf');
          var bytes = data.buffer.asUint8List();
          await file.writeAsBytes(bytes, flush: true);
          final result = await OpenFile.open(file.path);
          print(result.message);
        },
      );
    });
  }
}
