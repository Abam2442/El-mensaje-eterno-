import 'dart:convert';

import 'package:hiwayda_oracion_islamica/core/constants/app_api_routes.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:http/http.dart' as http;
import 'package:hiwayda_oracion_islamica/features/telegram_channels/data/models/telegram_channels_model.dart';

abstract class TelegramRemoteDataSource {
  Future<TelegramChannels> getOnlineChannels();
}

class TelegramRemoteDataSourceImpl extends TelegramRemoteDataSource {
  @override
  Future<TelegramChannels> getOnlineChannels() async {
    try {
      final response = await http
          .get(Uri.parse('${AppApiRoutes.jsonApi}${AppKeys.telegram}'));
      final jsonString = utf8.decode(response.bodyBytes);
      final finalData = json.decode(jsonString);
      TelegramChannels channelsModel = TelegramChannels.fromJson(finalData);

      return channelsModel;
    } catch (e) {
      rethrow;
    }
  }
}
