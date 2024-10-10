import 'dart:convert';
// import 'package:elresala/features/sites/data/models/the_key_to_islam_model.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/models/the_key_to_islam_model.dart';

import '../../../../core/constants/app_keys.dart';
import '../../../../core/services/archive_service.dart';
import '../../../../core/services/shared_preferences_service.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

abstract class TheKeyToIslamLocalDataSource {
  Future<List<TheKeyToIslamfirst>> getArtical();
}

class TheKeyToIslamLocalDataSourceImp extends TheKeyToIslamLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  TheKeyToIslamLocalDataSourceImp({
    required this.sharedPreferencesService,
    required this.archiveService,
  });
  @override
  Future<List<TheKeyToIslamfirst>> getArtical() async {
    Get.find<Logger>()
        .i("Start `getArtical` in |TheKeyToIslamLocalDataSourceImp|");
    String? fileContent =
        await archiveService.readFile(name: AppKeys.theKeyToIslam1);
    List<TheKeyToIslamfirst> articals = [];
    // List<Map<String, dynamic>> value = [];
    // value.map((element) {element.})
    var s = ' the key to islam';
    print(s.length);
    if (fileContent != null) {
      Map<String, dynamic> jsonData = json.decode(fileContent);
      // jsonData.values.last
      jsonData['the-key-to-islam'].forEach((key, value) {
        // print('name: $key');
        // print('description: ${value.values.first}');
        // print('videos: ${value.values.last}');
        articals.add(TheKeyToIslamfirst(
            name: key,
            description: value.values.first,
            videos: value.values.last != value.values.first
                ? (value.values.last as List<dynamic>)
                    .map((element) => Video(
                        title: element.keys.first, url: element.values.first))
                    .toList()
                : []));
      });
      // articals.add(thekeytoislam);
    }

    Get.find<Logger>()
        .w("End `getArtical` in |TheKeyToIslamLocalDataSourceImp|");
    return Future.value(articals);
  }
}
