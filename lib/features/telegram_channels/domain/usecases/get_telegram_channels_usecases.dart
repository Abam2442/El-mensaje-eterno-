import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/check_offline_files.dart';
import 'package:hiwayda_oracion_islamica/features/telegram_channels/data/models/telegram_channels_model.dart';
import 'package:hiwayda_oracion_islamica/features/telegram_channels/domain/repository/telegram_channels_repo.dart';

class GetTelegramChannelsUseCase {
  final TelegramChannelsRepo telegramChannelsRepo;

  GetTelegramChannelsUseCase(this.telegramChannelsRepo);

  Future<Either<Failure, TelegramChannels>> call() async {
    return await checkOfflineFiles(AppKeys.telegram)
        ? await telegramChannelsRepo.getChannels()
        : await telegramChannelsRepo.getOnlineChannels();
  }
}
