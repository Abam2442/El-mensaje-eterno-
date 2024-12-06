import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/data_source/local_data_source/islam_land_local_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/data_source/remote_data_source/islam_land_remote_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/entities/islam_land_entities.dart';
import '../../domain/repository/islam_land_repository.dart';

class IslamLandRepositoryImp extends IslamLandRepository {
  final IslamLandLocalDataSource islamLandLocalDataSource;
  final IslamLandRemoteDataSource _islamLandRemoteDataSource;
  IslamLandRepositoryImp(
    this._islamLandRemoteDataSource, {
    required this.islamLandLocalDataSource,
  });

  @override
  Future<Either<Failure, List<IslamLandFatwaEntities>>>
      getOfflineFatwa() async {
    try {
      var fatwa = await islamLandLocalDataSource.getOfflineFatwa();

      return Right(fatwa.cast<IslamLandFatwaEntities>());
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<List<FixedEntities>>>> getContent() async {
    // await islamLandLocalDataSource.getContent();
    try {
      var content = await islamLandLocalDataSource.getContent();

      return Right(content);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, Map<String, List<MediaEntity>>>> getBooks() async {
    try {
      var data = await islamLandLocalDataSource.getBooks();

      return Right(data);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getAudio() async {
    try {
      var data = await islamLandLocalDataSource.getAudio();

      return Right(data);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getOnlineFatwa() async {
    try {
      var data = await islamLandLocalDataSource.getOnlineFatwa();

      return Right(data);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getVideos() async {
    try {
      var data = await islamLandLocalDataSource.getVideos();

      return Right(data);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<IslamLandFatwaEntities>>>
      getNetOfflineFatwa() async {
    try {
      var response = await _islamLandRemoteDataSource.getNetOfflineFatwa();
      return Right(response);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getNetOnlineFatwa() async {
    try {
      var response = await _islamLandRemoteDataSource.getNetFatwa();
      return Right(response);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getOnlineAudio() async {
    try {
      var response = await _islamLandRemoteDataSource.getOnlineAudio();
      return Right(response);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, Map<String, List<MediaEntity>>>>
      getOnlineBooks() async {
    try {
      var response = await _islamLandRemoteDataSource.getOnlineBooks();
      return Right(response);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<List<FixedEntities>>>> getOnlineContent() async {
    try {
      var response = await _islamLandRemoteDataSource.getOnlineContent();
      return Right(response);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getOnlineVideos() async {
    try {
      var response = await _islamLandRemoteDataSource.getOnlineVideos();
      return Right(response);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
