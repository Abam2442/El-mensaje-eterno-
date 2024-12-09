import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/data_source/local_data_source/guide_to_islam_local_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/data_source/remote_data_source/guide_to_islam_remote_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/repository/guide_to_islam_repository.dart';

class GuideToIslamRepositoryImp extends GuideToIslamRepository {
  final GuideToIslamLocalDataSource islamLocalDataSource;
  final GuideToIslamRemoteDataSource? _dataSource;
  GuideToIslamRepositoryImp(
    this._dataSource, {
    required this.islamLocalDataSource,
  });

  @override
  Future<Either<Failure, List<FixedEntities>>> getContent() async {
    try {
      var content = await islamLocalDataSource.getContect();

      return Right(content);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getBooks() async {
    try {
      var content = await islamLocalDataSource.getBooks();

      return Right(content);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getAudios() async {
    try {
      var content = await islamLocalDataSource.getAudios();

      return Right(content);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getVideos() async {
    try {
      var content = await islamLocalDataSource.getVideos();

      return Right(content);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<FixedEntities>>> getOnlineContent() async {
    try {
      final respone = await _dataSource!.getOnlineContect();
      return Right(respone);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
