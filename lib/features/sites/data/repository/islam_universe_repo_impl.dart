import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/repository/fixed_repository.dart';
import '../data_source/islam_universe_local_data_source.dart';

class IslamUniverseRepositoryImp extends FixedRepository {
  final IslamUniverseLocalDataSource islamUniverseLocalDataSource;
  IslamUniverseRepositoryImp({
    required this.islamUniverseLocalDataSource,
  });
  @override
  Future<Either<Failure, List<FixedEntities>>> getArtical() async {
    await islamUniverseLocalDataSource.getArtical();
    try {
      Get.find<Logger>()
          .i("Start `getArtical` in |IslamUniverseRepositoryImp|");
      var artical = await islamUniverseLocalDataSource.getArtical();
      Get.find<Logger>().w(
          "End `getArtical` in |IslamUniverseRepositoryImp| ${artical.length}");
      return Right(artical);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getArtical` in |IslamUniverseRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }
}
