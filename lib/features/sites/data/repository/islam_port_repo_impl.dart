import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/repository/fixed_repository.dart';
import '../data_source/islam_port_local_data_source.dart';

class IslamPortRepositoryImp extends FixedRepository {
  final IslamPortLocalDataSource islamPortLocalDataSource;
  IslamPortRepositoryImp({
    required this.islamPortLocalDataSource,
  });
  @override
  Future<Either<Failure, List<FixedEntities>>> getArtical() async {
    await islamPortLocalDataSource.getArtical();
    try {
      Get.find<Logger>().i("Start `getArtical` in |IslamPortRepositoryImp|");
      var artical = await islamPortLocalDataSource.getArtical();
      Get.find<Logger>()
          .w("End `getArtical` in |IslamPortRepositoryImp| ${artical.length}");
      return Right(artical);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getArtical` in |IslamPortRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }
}
