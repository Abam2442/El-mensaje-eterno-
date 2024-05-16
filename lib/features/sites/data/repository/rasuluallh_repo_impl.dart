import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/repository/rasuluallh_repository_repository.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/islam_religion_entities.dart';
import '../data_source/rasuluallah_local_data_source.dart';

class RasuluallhRepositoryImp extends RasuluallhRepository {
  final RasuluallhLocalDataSource rasuluallhLocalDataSource;
  RasuluallhRepositoryImp({
    required this.rasuluallhLocalDataSource,
  });
  @override
  Future<Either<Failure, List<IslamReligionEntities>>> getContent() async {
    await rasuluallhLocalDataSource.getContent();
    try {
      Get.find<Logger>().i("Start `getContent` in |RasuluallhRepositoryImp|");
      var artical = await rasuluallhLocalDataSource.getContent();
      Get.find<Logger>()
          .w("End `getContent` in |RasuluallhRepositoryImp| ${artical.length}");
      return Right(artical);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getContent` in |RasuluallhRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getAudios() async {
    try {
      Get.find<Logger>().i("Start `getAudios` in |RasuluallhRepositoryImp|");
      var artical = await rasuluallhLocalDataSource.getAudios();
      Get.find<Logger>()
          .w("End `getAudios` in |RasuluallhRepositoryImp| ${artical.length}");
      return Right(artical);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getAudios` in |RasuluallhRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaCategoryEntity>>> getVideos() async {
    try {
      Get.find<Logger>().i("Start `getVideos` in |RasuluallhRepositoryImp|");
      var artical = await rasuluallhLocalDataSource.getVideos();
      Get.find<Logger>()
          .w("End `getVideos` in |RasuluallhRepositoryImp| ${artical.length}");
      return Right(artical);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getVideos` in |RasuluallhRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }
}
