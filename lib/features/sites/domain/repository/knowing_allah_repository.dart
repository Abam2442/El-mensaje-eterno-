import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/models/knowing_allah_model.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import '../../../../core/errors/failures.dart';

abstract class KnowingAllahRepository {
  Future<Either<Failure, List<KnowingAllahSubCategoryModel>>> getArtical();
  Future<Either<Failure, List<MediaEntity>>> getBooks();
  Future<Either<Failure, List<MediaEntity>>> getAudios();
  Future<Either<Failure, List<MediaCategoryEntity>>> getVideos();

  Future<Either<Failure, List<KnowingAllahSubCategoryModel>>>
      getOnlineArtical();
  Future<Either<Failure, List<MediaEntity>>> getOnlineBooks();
  Future<Either<Failure, List<MediaEntity>>> getOnlineAudios();
  Future<Either<Failure, List<MediaCategoryEntity>>> getOnlineVideos();
}
