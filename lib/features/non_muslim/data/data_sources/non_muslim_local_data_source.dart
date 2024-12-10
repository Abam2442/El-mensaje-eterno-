import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/features/non_muslim/data/models/course_model.dart';
import 'package:path_provider/path_provider.dart';

abstract class NonMuslimLocalDataSource {
  Future<List<NonMuslimModel>> getCourses();
}

class NonMuslimLocalDataSourceImpl extends NonMuslimLocalDataSource {
  @override
  Future<List<NonMuslimModel>> getCourses() async {
    try {
      List<NonMuslimModel> hadithes = [];
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/${AppKeys.nonMuslims}');
      String jsonString = file.readAsStringSync();
      final finalData = json.decode(jsonString);
      hadithes = finalData
          .map<NonMuslimModel>(
            (surah) => NonMuslimModel.fromJson(surah),
          )
          .toList();

      return hadithes;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
