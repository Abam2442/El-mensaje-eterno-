import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/book_entities.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
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
      Get.find<Logger>().i("Start `getArtical` in |IslamMessageRepositoryImp|");
      var artical = await islamMessageLocalDataSource.getArtical();
      Get.find<Logger>().w(
          "End `getArtical` in |IslamMessageRepositoryImp| ${artical.length}");
      return Right(artical);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getArtical` in |IslamMessageRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getAudio() async {
    await islamMessageLocalDataSource.getAudio();
    try {
      Get.find<Logger>().i("Start `getAudio` in |IslamMessageRepositoryImp|");
      var audio = await islamMessageLocalDataSource.getAudio();
      Get.find<Logger>()
          .w("End `getAudio` in |IslamMessageRepositoryImp| ${audio.length}");
      return Right(audio);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getAudio` in |IslamMessageRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getVideos() async {
    await islamMessageLocalDataSource.getVideos();
    try {
      Get.find<Logger>().i("Start `getVideos` in |IslamMessageRepositoryImp|");
      var videos = await islamMessageLocalDataSource.getVideos();
      Get.find<Logger>()
          .w("End `getVideos` in |IslamMessageRepositoryImp| ${videos.length}");
      return Right(videos);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getVideos` in |IslamMessageRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaCategoryEntity>>> getBook() async {
    await islamMessageLocalDataSource.getBook();
    try {
      Get.find<Logger>().i("Start `getBook` in |IslamMessageRepositoryImp|");
      var book = await islamMessageLocalDataSource.getBook();
      Get.find<Logger>()
          .w("End `getBook` in |IslamMessageRepositoryImp| ${book.length}");
      return Right(book);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getBook` in |IslamMessageRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }
}
