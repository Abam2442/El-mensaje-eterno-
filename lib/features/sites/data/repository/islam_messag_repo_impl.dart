import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/islam_message_entities.dart';
import '../../domain/repository/islam_message_repository.dart';
import '../data_source/islam_message_local_data_source.dart';

class IslamMessageRepositoryImp extends IslamMessageRepository {
  final IslamMessageLocalDataSource islamMessageLocalDataSource;
  IslamMessageRepositoryImp({
    required this.islamMessageLocalDataSource,
  });
  @override
  Future<Either<Failure, List<IslamMessageArticalEntities>>>
      getArtical() async {
    await islamMessageLocalDataSource.getArtical();
    try {
      var artical = await islamMessageLocalDataSource.getArtical();

      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getAudio() async {
    await islamMessageLocalDataSource.getAudio();
    try {
      var audio = await islamMessageLocalDataSource.getAudio();

      return Right(audio);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getVideos() async {
    await islamMessageLocalDataSource.getVideos();
    try {
      var videos = await islamMessageLocalDataSource.getVideos();

      return Right(videos);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getQuranVideos() async {
    await islamMessageLocalDataSource.getQuranVideos();
    try {
      var videos = await islamMessageLocalDataSource.getQuranVideos();

      return Right(videos);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaCategoryEntity>>> getBook() async {
    await islamMessageLocalDataSource.getBook();
    try {
      var book = await islamMessageLocalDataSource.getBook();

      return Right(book);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
