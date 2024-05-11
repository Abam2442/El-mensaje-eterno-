import 'package:dartz/dartz.dart';

import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/features/youtubechannels/data/models/youtube_model.dart';
import 'package:hiwayda_oracion_islamica/features/youtubechannels/domain/repository/youtube_channels_repo.dart';
import 'package:logger/logger.dart';

class GetYoutubeChannelsUseCase {
  final YoutubeChannelsRepo youtubeChannelsRepo;

  GetYoutubeChannelsUseCase(this.youtubeChannelsRepo);

  Future<Either<Failure, List<YoutubeModel>>> call() async {
    Get.find<Logger>().i("Call GetYotubeChannelsUseCase");
    return await youtubeChannelsRepo.getChannels();
  }
}
