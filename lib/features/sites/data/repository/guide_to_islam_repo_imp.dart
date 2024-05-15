import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/repository/guide_to_islam_repository.dart';
import '../data_source/guide_to_islam_local_data_source.dart';

class GuideToIslamRepositoryImp extends GuideToIslamRepository {
  final GuideToIslamLocalDataSource islamLocalDataSource;
  GuideToIslamRepositoryImp({
    required this.islamLocalDataSource,
  });

  @override
  Future<Either<Failure, List<List<FixedEntities>>>> getContent() async {
    try {
      Get.find<Logger>().i("Start `getContent` in |GuideToIslamRepositoryImp|");
      var content = await islamLocalDataSource.getContect();
      Get.find<Logger>().w(
          "End `getContent` in |GuideToIslamRepositoryImp| ${content.length}");
      return Right(content);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getContent` in |GuideToIslamRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getBooks() async {
    try {
      Get.find<Logger>().i("Start `getBooks` in |GuideToIslamRepositoryImp|");
      var content = await islamLocalDataSource.getBooks();
      Get.find<Logger>()
          .w("End `getBooks` in |GuideToIslamRepositoryImp| ${content.length}");
      return Right(content);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getBooks` in |GuideToIslamRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getAudios() async {
    try {
      Get.find<Logger>().i("Start `getAudios` in |GuideToIslamRepositoryImp|");
      var content = await islamLocalDataSource.getAudios();
      Get.find<Logger>().w(
          "End `getAudios` in |GuideToIslamRepositoryImp| ${content.length}");
      return Right(content);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getAudios` in |GuideToIslamRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }
}
