import 'package:dartz/dartz.dart';

import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/check_offline_files.dart';
import 'package:hiwayda_oracion_islamica/features/youtubechannels/data/models/youtube_model.dart';
import 'package:hiwayda_oracion_islamica/features/youtubechannels/domain/repository/youtube_channels_repo.dart';

class GetYoutubeChannelsUseCase {
  final YoutubeChannelsRepo youtubeChannelsRepo;

  GetYoutubeChannelsUseCase(this.youtubeChannelsRepo);

  Future<Either<Failure, List<YoutubeModel>>> call() async {
    return await checkOfflineFiles('data-1.json')
        ? await youtubeChannelsRepo.getChannels()
        : await youtubeChannelsRepo.getOnlineChannels();
  }
}
