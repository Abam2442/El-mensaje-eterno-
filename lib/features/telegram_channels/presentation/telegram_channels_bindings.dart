import 'package:hiwayda_oracion_islamica/features/telegram_channels/data/data_sources/telegram_channels_local_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/telegram_channels/data/data_sources/telegram_remote_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/telegram_channels/data/repository/telegram_channels_repo_impl.dart';
import 'package:hiwayda_oracion_islamica/features/telegram_channels/domain/repository/telegram_channels_repo.dart';
import 'package:hiwayda_oracion_islamica/features/telegram_channels/presentation/controller/telegram_channels_controller.dart';
import 'package:get/get.dart';

class TelegramChannelsBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<TelegramChannelsModelLocalDataSource>(
      TelegramChannelsModelLocalDataSourceImpl(
        sharedPreferencesService: Get.find(),
      ),
    );
    Get.put<TelegramChannelsRepo>(TelegramChannelsRepoImpl(
      telegramChannelsModelLocalDataSource: Get.find(),
      Get.put(TelegramRemoteDataSourceImpl()),
    ));

    Get.put(TelegramChannelsController());
  }
}
