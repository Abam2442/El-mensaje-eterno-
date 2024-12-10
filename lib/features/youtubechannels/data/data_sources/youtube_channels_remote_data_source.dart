import 'package:hiwayda_oracion_islamica/core/helper/functions/get_online_data.dart';
import 'package:hiwayda_oracion_islamica/features/youtubechannels/data/models/youtube_model.dart';

abstract class YoutubeChannelsRemoteDataSource {
  Future<List<YoutubeModel>> getOnlineYoutubeChannels();
}

class YoutubeChannelsRemoteDataSourceImpl
    extends YoutubeChannelsRemoteDataSource {
  @override
  Future<List<YoutubeModel>> getOnlineYoutubeChannels() async {
    try {
      List<YoutubeModel> youtubechannels = [];
      final finalData = await getOnlineData('data-1.json');
      finalData['channels'].forEach((v) {
        youtubechannels.add(YoutubeModel.fromJson(v));
      });
      return youtubechannels;
    } catch (e) {
      rethrow;
    }
  }
}
