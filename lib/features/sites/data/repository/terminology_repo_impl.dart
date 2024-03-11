import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/repository/fixed_repository.dart';
import '../data_source/terminology_local_data_source.dart';

class TerminologyRepositoryImp extends FixedRepository {
  final TerminologyLocalDataSource terminologyLocalDataSource;
  TerminologyRepositoryImp({
    required this.terminologyLocalDataSource,
  });
  @override
  Future<Either<Failure, List<FixedEntities>>> getArtical() async {
    await terminologyLocalDataSource.getArtical();
    try {
      Get.find<Logger>().i("Start `getArtical` in |TerminologyRepositoryImp|");
      var artical = await terminologyLocalDataSource.getArtical();
      Get.find<Logger>().w(
          "End `getArtical` in |TerminologyRepositoryImp| ${artical.length}");
      return Right(artical);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getArtical` in |TerminologyRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }
}
