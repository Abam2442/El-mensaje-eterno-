import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/data_source/local_data_source/rasuluallah_local_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/data_source/remote_data_source/rasuluallh_remote_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/repository/rasuluallh_repository_repository.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';

class RasuluallhRepositoryImp extends RasuluallhRepository {
  final RasuluallhLocalDataSource rasuluallhLocalDataSource;
  final RasuluallhRemoteDataSource _rasuluallhRemoteDataSource;
  RasuluallhRepositoryImp(
    this._rasuluallhRemoteDataSource, {
    required this.rasuluallhLocalDataSource,
  });
  @override
  Future<Either<Failure, List<CategoryFixedEntity>>> getContent() async {
    await rasuluallhLocalDataSource.getContent();
    try {
      var artical = await rasuluallhLocalDataSource.getContent();

      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getAudios() async {
    try {
      var artical = await rasuluallhLocalDataSource.getAudios();

      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaCategoryEntity>>> getVideos() async {
    try {
      var artical = await rasuluallhLocalDataSource.getVideos();

      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getOnlineAudios() async {
    try {
      List<MediaEntity> artical =
          await _rasuluallhRemoteDataSource.getOnlineAudios();
      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<CategoryFixedEntity>>> getOnlineContent() async {
    try {
      List<CategoryFixedEntity> artical =
          await _rasuluallhRemoteDataSource.getOnlineContent();
      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaCategoryEntity>>> getOnlineVideos() async {
    try {
      List<MediaCategoryEntity> artical =
          await _rasuluallhRemoteDataSource.getOnlineVideos();
      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
