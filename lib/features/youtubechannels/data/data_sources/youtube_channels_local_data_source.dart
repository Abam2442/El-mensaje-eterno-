import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/youtubechannels/data/models/youtube_model.dart';
import 'package:logger/logger.dart';

abstract class YoutubeChannelsModelLocalDataSource {
  Future<List<YoutubeModel>> getYoutubeChannels();
}

class YoutubeChannelsModelLocalDataSourceImpl
    extends YoutubeChannelsModelLocalDataSource {
  @override
  Future<List<YoutubeModel>> getYoutubeChannels() async {
    Get.find<Logger>().i(
        "Start `getYoutubeChannels` in |YoutubeChannelsModelLocalDataSourceImpl|");
    List<YoutubeModel> youtubechannels = [];
    String data = await rootBundle.loadString('assets/json/data-1.json');
    var data1 = jsonDecode(data);
    data1['channels'].forEach((v) {
      youtubechannels.add(YoutubeModel.fromJson(v));
    });

    return youtubechannels;
  }
}
