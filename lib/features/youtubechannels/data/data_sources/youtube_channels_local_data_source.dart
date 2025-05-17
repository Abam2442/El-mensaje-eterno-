import 'package:hiwayda_oracion_islamica/core/helper/functions/get_assets_data.dart';
import 'package:hiwayda_oracion_islamica/features/youtubechannels/data/models/youtube_model.dart';

abstract class YoutubeChannelsModelLocalDataSource {
  Future<List<YoutubeModel>> getYoutubeChannels();
}

class YoutubeChannelsModelLocalDataSourceImpl
    extends YoutubeChannelsModelLocalDataSource {
  @override
  Future<List<YoutubeModel>> getYoutubeChannels() async {
    List<YoutubeModel> youtubechannels = [];
    final data1 = await getAssetsData('data-1.json');
    data1['channels'].forEach((v) {
      youtubechannels.add(YoutubeModel.fromJson(v));
    });

    return youtubechannels;
  }
}
