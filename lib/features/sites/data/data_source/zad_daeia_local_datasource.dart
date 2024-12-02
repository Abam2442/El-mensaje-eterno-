import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/services/archive_service.dart';
import 'package:hiwayda_oracion_islamica/core/services/shared_preferences_service.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/zad_daeia_entity.dart';
import 'package:logger/logger.dart';

abstract class ZadDaeiaLocalDatasource {
  Future<List<ZadDaeiaEntity>> getZads();
}

class ZadDaeiaLocalDatasourceImpl extends ZadDaeiaLocalDatasource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  ZadDaeiaLocalDatasourceImpl({
    required this.sharedPreferencesService,
    required this.archiveService,
  });

  @override
  Future<List<ZadDaeiaEntity>> getZads() async {
    try {
      Get.find<Logger>().i("Start `getZads` in |ZadDaeiaLocalDatasourceImpl|");
      String? fileContent =
          await archiveService.readFile(name: AppKeys.zadDaeia);

      List<ZadDaeiaEntity> topics = [];
//       if (fileContent != null) {
//         debugPrint("top.sectionName");

//         var jsonData = json.decode(fileContent);
//         debugPrint("zadD aiey content: ${jsonData}");

//         topics = jsonData
//             .skip(1) // Ignore le premier élément

//             .map<ZadDaeiaEntity>((topic, id) {
//           final top = ZadDaeiaEntity.fromJson(topic);
//           debugPrint(top.sectionName);
//           return top;
// // ZadDaeiaEntity.fromJson(topic)
//         }).toList();

//         // jsonData.forEach((key, value) {
//         //   final top = ZadDaeiaEntity.fromJson(value);

//         //   topics.add(top);
//         // });
//       }

      if (fileContent != null) {
        debugPrint("File content loaded");

        var jsonData = json.decode(fileContent);
        // debugPrint("Decoded JSON: $jsonData");
        // jsonData.map((topic) => debugPrint("Topic: $topic"));
        topics = jsonData
            // .skip(2) // Ignore le premier élément
            .map<ZadDaeiaEntity>((topic) {
              // try {
              final top = ZadDaeiaEntity.fromJson(topic);
              debugPrint("Parsed section: ${top.sectionName}");
              return top;
              // } catch (e) {
              //   debugPrint("Error parsing topic: $e");
              //   return null; // ou gestion d'erreur
              // }
            })
            .where((element) => element != null)
            // .cast<ZadDaeiaEntity>()
            .toList();
      }

      Get.find<Logger>().w("End `getZads` in |ZadDaeiaLocalDatasourceImpl|");
      // debugPrint("zadD aiey content: ${topics[0].topics[0].nestedTopics}");

      // debugPrint("zadD aiey content: ${topics.length}");

      // /  `

      return Future.value(topics);
    } catch (e, trace) {
      debugPrint("zadD aiey exception ${e}");
      debugPrintStack(stackTrace: trace);
      rethrow;
    }
  }
}
