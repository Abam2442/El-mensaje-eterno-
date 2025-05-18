import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/features/telegram_channels/data/models/telegram_channels_model.dart';

abstract class TelegramChannelsRepo {
  Future<Either<Failure, TelegramChannels>> getOfflineChannels();
}
