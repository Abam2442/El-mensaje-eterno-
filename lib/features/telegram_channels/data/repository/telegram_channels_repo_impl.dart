import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/core/helpers/get_failure_from_exception.dart';
import 'package:hiwayda_oracion_islamica/features/telegram_channels/data/data_sources/telegram_channels_local_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/telegram_channels/data/data_sources/telegram_remote_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/telegram_channels/data/models/telegram_channels_model.dart';
import 'package:hiwayda_oracion_islamica/features/telegram_channels/domain/repository/telegram_channels_repo.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class TelegramChannelsRepoImpl implements TelegramChannelsRepo {
  final TelegramChannelsModelLocalDataSource
      telegramChannelsModelLocalDataSource;
  final TelegramRemoteDataSource _telegramRemoteDataSource;

  const TelegramChannelsRepoImpl(
    this._telegramRemoteDataSource, {
    required this.telegramChannelsModelLocalDataSource,
  });

  @override
  Future<Either<Failure, TelegramChannels>> getChannels() async {
    try {
      Get.find<Logger>().i("Start `getChannels` in |TelegramChannelsRepoImpl|");
      var channels =
          await telegramChannelsModelLocalDataSource.getTelegramChannels();
      Get.find<Logger>().w(
          "End `getChannels` in |TelegramChannelsRepoImpl| ${channels.telegramChannels.length}");
      return Right(channels);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, TelegramChannels>> getOnlineChannels() async {
    try {
      final response = await _telegramRemoteDataSource.getOnlineChannels();
      return Right(response);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
