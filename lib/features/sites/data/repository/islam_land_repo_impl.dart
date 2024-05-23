import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/entities/islam_land_entities.dart';
import '../../domain/repository/islam_land_repository.dart';
import '../data_source/islam_land_local_data_source.dart';

class IslamLandRepositoryImp extends IslamLandRepository {
  final IslamLandLocalDataSource islamLandLocalDataSource;
  IslamLandRepositoryImp({
    required this.islamLandLocalDataSource,
  });

  @override
  Future<Either<Failure, List<IslamLandFatwaEntities>>>
      getOfflineFatwa() async {
    try {
      Get.find<Logger>()
          .i("Start `getOfflineFatwa` in |IslamLandRepositoryImp|");
      var fatwa = await islamLandLocalDataSource.getOfflineFatwa();
      Get.find<Logger>()
          .w("End `getFatwa` in |IslamLandRepositoryImp| ${fatwa.length}");
      return Right(fatwa.cast<IslamLandFatwaEntities>());
    } catch (e) {
      Get.find<Logger>().e(
          "End `getOfflineFatwa` in |IslamLandRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<List<FixedEntities>>>> getContent() async {
    // await islamLandLocalDataSource.getContent();
    try {
      Get.find<Logger>().i("Start `getContent` in |IslamLandRepositoryImp|");
      var content = await islamLandLocalDataSource.getContent();
      Get.find<Logger>()
          .w("End `getContent` in |IslamLandRepositoryImp| ${content.length}");
      return Right(content);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getContent` in |IslamLandRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, Map<String, List<MediaEntity>>>> getBooks() async {
    try {
      Get.find<Logger>().i("Start `getBooks` in |IslamLandRepositoryImp|");
      var data = await islamLandLocalDataSource.getBooks();
      Get.find<Logger>()
          .w("End `getBooks` in |IslamLandRepositoryImp| ${data.length}");
      return Right(data);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getBooks` in |IslamLandRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getAudio() async {
    try {
      Get.find<Logger>().i("Start `getAudio` in |IslamLandRepositoryImp|");
      var data = await islamLandLocalDataSource.getAudio();
      Get.find<Logger>()
          .w("End `getAudio` in |IslamLandRepositoryImp| ${data.length}");
      return Right(data);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getAudio` in |IslamLandRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getOnlineFatwa() async {
    try {
      Get.find<Logger>()
          .i("Start `getOnlineFatwa` in |IslamLandRepositoryImp|");
      var data = await islamLandLocalDataSource.getOnlineFatwa();
      Get.find<Logger>()
          .w("End `getOnlineFatwa` in |IslamLandRepositoryImp| ${data.length}");
      return Right(data);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getOnlineFatwa` in |IslamLandRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getVideos() async {
    try {
      Get.find<Logger>().i("Start `getVideos` in |IslamLandRepositoryImp|");
      var data = await islamLandLocalDataSource.getVideos();
      Get.find<Logger>()
          .w("End `getVideos` in |IslamLandRepositoryImp| ${data.length}");
      return Right(data);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getVideos` in |IslamLandRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }
}
