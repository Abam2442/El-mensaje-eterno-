import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_offline_data.dart';
import 'package:hiwayda_oracion_islamica/features/telegram_channels/data/models/telegram_channels_model.dart';

abstract class TelegramChannelsModelLocalDataSource {
  Future<TelegramChannels> getTelegramChannels();
}

class TelegramChannelsModelLocalDataSourceImpl
    extends TelegramChannelsModelLocalDataSource {
  @override
  Future<TelegramChannels> getTelegramChannels() async {
    try {
      final jsonData = await getOfflineData(AppKeys.telegram);

      TelegramChannels channelsModel = TelegramChannels.fromJson(jsonData);

      return channelsModel;
    } catch (e) {
      rethrow;
    }
  }
}
