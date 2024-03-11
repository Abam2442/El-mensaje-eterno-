import 'package:dartz/dartz.dart';
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
  Future<Either<Failure, List<IslamLandFatwaEntities>>> getFatwa() async {
    await islamLandLocalDataSource.getFatwa();
    try {
      Get.find<Logger>().i("Start `getFatwa` in |IslamLandRepositoryImp|");
      var fatwa = await islamLandLocalDataSource.getFatwa();
      Get.find<Logger>()
          .w("End `getFatwa` in |IslamLandRepositoryImp| ${fatwa.length}");
      return Right(fatwa.cast<IslamLandFatwaEntities>());
    } catch (e) {
      Get.find<Logger>().e(
          "End `getFatwa` in |IslamLandRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<List<FixedEntities>>>> getContent() async {
    await islamLandLocalDataSource.getContent();
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
}
