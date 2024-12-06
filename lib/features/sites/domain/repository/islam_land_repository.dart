import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import '../../../../core/errors/failures.dart';
import '../entities/islam_land_entities.dart';

abstract class IslamLandRepository {
  Future<Either<Failure, List<List<FixedEntities>>>> getContent();
  Future<Either<Failure, Map<String, List<MediaEntity>>>> getBooks();
  Future<Either<Failure, List<IslamLandFatwaEntities>>> getOfflineFatwa();
  Future<Either<Failure, List<MediaEntity>>> getAudio();
  Future<Either<Failure, List<MediaEntity>>> getVideos();
  Future<Either<Failure, List<MediaEntity>>> getOnlineFatwa();

  Future<Either<Failure, List<List<FixedEntities>>>> getOnlineContent();
  Future<Either<Failure, Map<String, List<MediaEntity>>>> getOnlineBooks();
  Future<Either<Failure, List<IslamLandFatwaEntities>>> getNetOfflineFatwa();
  Future<Either<Failure, List<MediaEntity>>> getOnlineAudio();
  Future<Either<Failure, List<MediaEntity>>> getOnlineVideos();
  Future<Either<Failure, List<MediaEntity>>> getNetOnlineFatwa();
}
