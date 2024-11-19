import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/features/youtubechannels/data/models/youtube_model.dart';

abstract class YoutubeChannelsRepo {
  Future<Either<Failure, List<YoutubeModel>>> getChannels();
}
