// import 'package:elresala/features/sites/data/models/the_key_to_islam_model.dart';

// import 'package:elresala/features/sites/data/models/the_key_to_islam_2_model.dart';

import 'package:hiwayda_oracion_islamica/core/helper/functions/get_offline_data.dart';

import '../../../../../core/constants/app_keys.dart';
import '../../../../../core/services/shared_preferences_service.dart';

import '../../models/the_key_to_islam_2_model.dart';

abstract class TheKeyToIslam2LocalDataSource {
  Future<List<TheKeyToIslam2>> getArtical();
}

class TheKeyToIslam2LocalDataSourceImp extends TheKeyToIslam2LocalDataSource {
  final SharedPreferencesService sharedPreferencesService;

  TheKeyToIslam2LocalDataSourceImp({
    required this.sharedPreferencesService,
  });
  @override
  Future<List<TheKeyToIslam2>> getArtical() async {
    // Get.find<Logger>()
    //     .i("Start `getArtical` in |TheKeyToIslam2LocalDataSourceImp|");
    // String? fileContent =
    //     await archiveService.readFile(name: AppKeys.theKeyToIslam2);
    final jsonData = await getOfflineData(AppKeys.theKeyToIslam2);

    List<TheKeyToIslam2> articals = [];
    // List<Map<String, dynamic>> value = [];
    // value.map((element) {element.})
    // var s = ' the key to islam';
    // print(s.length);
    // if (fileContent != null) {
    //   Map<String, dynamic> jsonData = json.decode(fileContent);
    // jsonData.values.last
    jsonData['the-key-to-islam-2']['articles'].forEach((value) {
      // print('page_text: ${value['page_text']}');
      // print('description: ${value.values.first}');
      // print('videos: ${value.values.last}');
      articals.add(TheKeyToIslam2(
          pageText: value['page_text'],
          // description: value.values.first,
          videos: (value['videos'] as List).isNotEmpty
              ? (value['videos'] as List<dynamic>)
                  .map((element) => Video(
                      pageVideoDescription: element['page_video_description'],
                      pageVideoTitle: element['page_video_title'],
                      pageVideoUrl: element['page_video_url']))
                  .toList()
              : []));
    });
    // articals.add(thekeytoislam);
    // }

    // Get.find<Logger>()
    //     .w("End `getArtical` in |TheKeyToIslam2LocalDataSourceImp|");
    return Future.value(articals);
  }
}
