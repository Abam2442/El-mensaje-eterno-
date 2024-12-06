import 'package:hiwayda_oracion_islamica/core/helper/functions/get_offline_data.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import '../../../../../core/constants/app_keys.dart';
import '../../../../../core/services/shared_preferences_service.dart';
import '../../../domain/entities/fixed_entities.dart';
import '../../../domain/entities/islam_land_entities.dart';

abstract class IslamLandLocalDataSource {
  Future<List<List<FixedEntities>>> getContent();
  Future<List<IslamLandFatwaEntities>> getOfflineFatwa();
  Future<Map<String, List<MediaEntity>>> getBooks();
  Future<List<MediaEntity>> getAudio();
  Future<List<MediaEntity>> getVideos();
  Future<List<MediaEntity>> getOnlineFatwa();
}

class IslamLandLocalDataSourceImpl extends IslamLandLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;

  IslamLandLocalDataSourceImpl({
    required this.sharedPreferencesService,
  });

  @override
  Future<List<List<FixedEntities>>> getContent() async {
    try {
      // String? islamLandJson =
      //     await archiveService.readFile(name: AppKeys.islamLand);
      List<FixedEntities> articals = [];
      List<FixedEntities> articalsOn = [];
      final jsonData = await getOfflineData(AppKeys.islamLand);

      // if (islamLandJson != null) {
      // var jsonData = json.decode(islamLandJson);
      jsonData['islam-Land']['Articles'].forEach((key, value) {
        articals.add(FixedEntities(name: key, content: value));
      });
      // }

      // if (islamLandJson != null) {
      // var jsonData = json.decode(islamLandJson);
      jsonData['islam-Land']['Articles Online'].forEach((key, value) {
        articalsOn.add(FixedEntities(name: key, content: value));
      });
      // }

      return Future.value([articals, articalsOn]);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, List<MediaEntity>>> getBooks() async {
    try {
      Map<String, List<MediaEntity>> result = {};
      // String? islamLandJson =
      // await archiveService.readFile(name: AppKeys.islamLandBooks);
      // if (islamLandJson != null) {
      // Map<String, dynamic> decoded = jsonDecode(islamLandJson);
      final jsonData = await getOfflineData(AppKeys.islamLandBooks);

      jsonData.forEach((bookCategory, value) {
        result[bookCategory] = [];
        for (Map booksMap in value) {
          booksMap.forEach((bookName, content) {
            MediaEntity bookEnitie = MediaEntity(name: bookName, url: content);
            result[bookCategory]!.add(bookEnitie);
          });
        }
      });
      // }
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getVideos() async {
    try {
      List<MediaEntity> result = [];
      // String? json =
      //     await archiveService.readFile(name: AppKeys.islamLandVideos);
      // if (json != null) {
      // Map<String, dynamic> decoded = jsonDecode(json);
      final jsonData = await getOfflineData(AppKeys.islamLandVideos);

      (jsonData['islam-Land']['Videos'] as Map).forEach((name, url) {
        result.add(MediaEntity(name: name, url: url));
      });
      // }
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<IslamLandFatwaEntities>> getOfflineFatwa() async {
    try {
      // String? islamLandJson =
      //     await archiveService.readFile(name: AppKeys.islamLandFatwa);
      List<IslamLandFatwaEntities> fatwas = [];
      final jsonData = await getOfflineData(AppKeys.islamLandFatwa);

      // if (islamLandJson != null) {
      // var jsonData = json.decode(islamLandJson);
      jsonData['islam-Land']['Fatawas'].forEach((key, value) {
        fatwas.add(IslamLandFatwaEntities(
            title: key, question: value['question'], answer: value['answer']));
      });
      // }

      return Future.value(fatwas);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getAudio() async {
    try {
      List<MediaEntity> result = [];
      // String? json =
      //     await archiveService.readFile(name: AppKeys.islamLandAudios);
      // if (json != null) {
      //   Map<String, dynamic> decoded = jsonDecode(json);
      final jsonData = await getOfflineData(AppKeys.islamLandAudios);

      (jsonData['islam-Land']['Audios'] as Map).forEach((name, url) {
        result.add(MediaEntity(name: name, url: url));
      });
      // }
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getOnlineFatwa() async {
    try {
      List<MediaEntity> result = [];
      // String? json =
      //     await archiveService.readFile(name: AppKeys.islamLandFatwa);
      // if (json != null) {
      //   Map<String, dynamic> decoded = jsonDecode(json);
      final jsonData = await getOfflineData(AppKeys.islamLandFatwa);

      (jsonData['islam-Land']['Fatwas Online'] as Map).forEach((name, url) {
        result.add(MediaEntity(name: name, url: url));
      });
      // }
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
