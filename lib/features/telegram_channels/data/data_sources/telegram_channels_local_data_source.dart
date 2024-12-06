import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_offline_data.dart';
import 'package:hiwayda_oracion_islamica/core/services/shared_preferences_service.dart';
import 'package:hiwayda_oracion_islamica/features/telegram_channels/data/models/telegram_channels_model.dart';

abstract class TelegramChannelsModelLocalDataSource {
  Future<TelegramChannels> getTelegramChannels();
}

class TelegramChannelsModelLocalDataSourceImpl
    extends TelegramChannelsModelLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;

  TelegramChannelsModelLocalDataSourceImpl({
    required this.sharedPreferencesService,
  });

  @override
  Future<TelegramChannels> getTelegramChannels() async {
    try {
      // Get.find<Logger>().i(
      // "Start `getTelegramChannels` in |TelegramChannelsModelLocalDataSourceImpl|");
      // Read the local JSON file
      // String? fileContent =
      // await archiveService.readFile(name: AppKeys.telegram);

      // Call the readFile method
      // Map<String, dynamic> jsonData = json.decode(fileContent!);
      //print('ssssss $jsonData');
      final jsonData = await getOfflineData(AppKeys.telegram);

      //  Map<String, dynamic> telegramChannels = jsonData["telegram-channels"];
      TelegramChannels channelsModel = TelegramChannels.fromJson(jsonData);

      return channelsModel;
    } catch (e) {
      rethrow;
    }
  }
}
