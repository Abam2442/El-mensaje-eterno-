import 'dart:convert';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import '../../../../core/constants/app_keys.dart';
import '../../../../core/services/archive_service.dart';
import '../../../../core/services/shared_preferences_service.dart';
import '../../domain/entities/fixed_entities.dart';

abstract class IslamHouseLocalDataSource {
  Future<List<FixedEntities>> getContect();
  Future<List<MediaEntity>> getBooks();
  Future<List<FixedEntities>> getFatwa();
}

class IslamHouseLocalDataSourceImpl extends IslamHouseLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  IslamHouseLocalDataSourceImpl({
    required this.sharedPreferencesService,
    required this.archiveService,
  });

  @override
  Future<List<FixedEntities>> getContect() async {
    try {
      String? islamHouseJson =
          await archiveService.readFile(name: AppKeys.islamHouse);

      List<FixedEntities> articals = [];
      if (islamHouseJson != null) {
        var jsonData = json.decode(islamHouseJson);

        jsonData['islam-house']['Articles'].forEach((key, value) {
          articals.add(FixedEntities(
            name: key,
            content: value,
          ));
        });
      }

      return Future.value(articals);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getBooks() async {
    try {
      List<MediaEntity> result = [];
      String? json =
          await archiveService.readFile(name: AppKeys.islamHouseBooks);
      if (json != null) {
        Map<String, dynamic> decoded = jsonDecode(json);

        (decoded['islam-house']['Books'] as Map).forEach((name, url) {
          result.add(MediaEntity(name: name, url: url));
        });
      }
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<FixedEntities>> getFatwa() async {
    try {
      List<FixedEntities> result = [];
      String? json =
          await archiveService.readFile(name: AppKeys.islamHouseFatwa);
      if (json != null) {
        Map<String, dynamic> decoded = jsonDecode(json);

        (decoded['islam-house']['Fatwa'] as Map).forEach((name, content) {
          result.add(FixedEntities(name: name, content: content));
        });
      }
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
