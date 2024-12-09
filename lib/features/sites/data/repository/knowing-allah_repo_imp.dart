import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/data_source/local_data_source/knowing_allah_local_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/data_source/remote_data_source/knowing_allah_remote_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/models/knowing_allah_model.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
// import 'package:elresala/features/sites/data/data_source/islam_qa_local_datasorce.dart';
// import 'package:elresala/features/sites/data/models/islam_qa.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/repository/knowing_allah_repository.dart';

class KnowingAllahRepositoryImp extends KnowingAllahRepository {
  final KnowingAllahLocalDataSource knowingAllahLocalDataSource;
  final KnowingAllahRemoteDataSource _knowingAllahRemoteDataSource;
  KnowingAllahRepositoryImp(
    this._knowingAllahRemoteDataSource, {
    required this.knowingAllahLocalDataSource,
  });
  @override
  Future<Either<Failure, List<KnowingAllahSubCategoryModel>>>
      getArtical() async {
    await knowingAllahLocalDataSource.getContent();
    try {
      var artical = await knowingAllahLocalDataSource.getContent();

      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getBooks() async {
    try {
      var artical = await knowingAllahLocalDataSource.getBooks();

      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getAudios() async {
    try {
      var artical = await knowingAllahLocalDataSource.getAudios();

      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaCategoryEntity>>> getVideos() async {
    try {
      var artical = await knowingAllahLocalDataSource.getVideos();

      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<KnowingAllahSubCategoryModel>>>
      getOnlineArtical() async {
    try {
      List<KnowingAllahSubCategoryModel> artical =
          await _knowingAllahRemoteDataSource.getOnlineContent();
      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getOnlineAudios() async {
    try {
      List<MediaEntity> artical =
          await _knowingAllahRemoteDataSource.getOnlineAudios();
      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getOnlineBooks() async {
    try {
      List<MediaEntity> artical =
          await _knowingAllahRemoteDataSource.getOnlineBooks();
      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaCategoryEntity>>> getOnlineVideos() async {
    try {
      List<MediaCategoryEntity> artical =
          await _knowingAllahRemoteDataSource.getOnlineVideos();
      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
