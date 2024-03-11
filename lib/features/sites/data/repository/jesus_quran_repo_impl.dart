import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/repository/fixed_repository.dart';
import '../data_source/jesus_quran_local_data_source.dart';

class JesusQuranRepositoryImp extends FixedRepository {
  final JesusQuranLocalDataSource jesusQuranLocalDataSource;
  JesusQuranRepositoryImp({
    required this.jesusQuranLocalDataSource,
  });
  @override
  Future<Either<Failure, List<FixedEntities>>> getArtical() async {
    await jesusQuranLocalDataSource.getArtical();
    try {
      Get.find<Logger>().i("Start `getArtical` in |JesusQuranRepositoryImp|");
      var artical = await jesusQuranLocalDataSource.getArtical();
      Get.find<Logger>()
          .w("End `getArtical` in |JesusQuranRepositoryImp| ${artical.length}");
      return Right(artical);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getArtical` in |JesusQuranRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }
}
