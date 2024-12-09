import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_assets_data.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/models/the_key_to_islam_2_model.dart';

abstract class TheKeyToIslam2LocalDataSource {
  Future<List<TheKeyToIslam2>> getArtical();
}

class TheKeyToIslam2LocalDataSourceImp extends TheKeyToIslam2LocalDataSource {
  @override
  Future<List<TheKeyToIslam2>> getArtical() async {
    final jsonData = await getAssetsData(AppKeys.theKeyToIslam2);

    List<TheKeyToIslam2> articals = [];
    jsonData['the-key-to-islam-2']['articles'].forEach((value) {
      articals.add(TheKeyToIslam2(
          pageText: value['page_text'],
          videos: (value['videos'] as List).isNotEmpty
              ? (value['videos'] as List<dynamic>)
                  .map((element) => Video(
                      pageVideoDescription: element['page_video_description'],
                      pageVideoTitle: element['page_video_title'],
                      pageVideoUrl: element['page_video_url']))
                  .toList()
              : []));
    });
    return Future.value(articals);
  }
}
