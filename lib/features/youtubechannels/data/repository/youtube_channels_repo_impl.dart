import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/core/helpers/get_failure_from_exception.dart';
import 'package:hiwayda_oracion_islamica/features/youtubechannels/data/data_sources/youtube_channels_local_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/youtubechannels/data/models/youtube_model.dart';
import 'package:hiwayda_oracion_islamica/features/youtubechannels/domain/repository/youtube_channels_repo.dart';
import 'package:logger/logger.dart';

class YoutubeChannelsRepoImpl implements YoutubeChannelsRepo{
 final YoutubeChannelsModelLocalDataSource youtubeChannelsModelLocalDataSource;

  const YoutubeChannelsRepoImpl({
    required this.youtubeChannelsModelLocalDataSource,
  });

  @override
  Future<Either<Failure, List<YoutubeModel>>> getChannels() async{
   try {
      Get.find<Logger>().i("Start `getChannels` in |YoutubeChannelsRepoImpl|");
      var channels = await youtubeChannelsModelLocalDataSource.getYoutubeChannels();
      Get.find<Logger>()
          .w("End `getChannels` in |YoutubeChannelsRepoImpl| ${channels.length}");
      return Right(channels);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getChannels` in |YoutubeChannelsRepoImpl| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }
}