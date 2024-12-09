// import 'package:elresala/features/sites/data/models/the_key_to_islam_model.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_assets_data.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/models/the_key_to_islam_model.dart';

abstract class TheKeyToIslamLocalDataSource {
  Future<List<TheKeyToIslamfirst>> getArtical();
}

class TheKeyToIslamLocalDataSourceImp extends TheKeyToIslamLocalDataSource {
  @override
  Future<List<TheKeyToIslamfirst>> getArtical() async {
    List<TheKeyToIslamfirst> articals = [];
    final jsonData = await getAssetsData(AppKeys.theKeyToIslam1);

    jsonData['the-key-to-islam'].forEach((key, value) {
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
    return Future.value(articals);
  }
}
