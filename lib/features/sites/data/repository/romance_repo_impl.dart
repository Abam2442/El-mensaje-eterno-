import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/repository/fixed_repository.dart';
import '../data_source/romance_local_data_source.dart';

class RomanceRepositoryImp extends FixedRepository {
  final RomanceLocalDataSource romanceLocalDataSource;
  RomanceRepositoryImp({
    required this.romanceLocalDataSource,
  });
  @override
  Future<Either<Failure, List<FixedEntities>>> getArtical() async {
    await romanceLocalDataSource.getArtical();
    try {
      Get.find<Logger>().i("Start `getArtical` in |RomanceRepositoryImp|");
      var artical = await romanceLocalDataSource.getArtical();
      Get.find<Logger>()
          .w("End `getArtical` in |RomanceRepositoryImp| ${artical.length}");
      return Right(artical);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getArtical` in |RomanceRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }
}
