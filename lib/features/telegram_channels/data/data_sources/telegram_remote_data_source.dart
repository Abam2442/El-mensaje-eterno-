import 'dart:convert';
import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_offline_data.dart';
import 'package:hiwayda_oracion_islamica/features/telegram_channels/data/models/telegram_channels_model.dart';

abstract class TelegramRemoteDataSource {
  Future<TelegramChannels> getOfflineChannels();
}

class TelegramRemoteDataSourceImpl extends TelegramRemoteDataSource {
  @override
  Future<TelegramChannels> getOfflineChannels() async {
    try {
      final response = await getOfflineData(AppKeys.telegram);
      TelegramChannels channelsModel = TelegramChannels.fromJson(response);

      return channelsModel;
    } catch (e) {
      rethrow;
    }
  }
}
