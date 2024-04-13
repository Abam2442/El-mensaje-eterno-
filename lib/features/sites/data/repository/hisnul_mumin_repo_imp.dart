import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/repository/fixed_repository.dart';
import '../../domain/repository/hisnul_mumin_repository.dart';
import '../data_source/hisnul_mumin_local_data_source.dart';
// import '../data_source/HisnulMumin_local_data_source.dart';

class HisnulMuminRepositoryImp extends HisnulMuminRepository {
  final HisnulMuminLocalDataSource hisnulMuminLocalDataSource;
  HisnulMuminRepositoryImp({
    required this.hisnulMuminLocalDataSource,
  });
  @override
  Future<Either<Failure, List<FixedEntities>>> getArtical() async {
    await hisnulMuminLocalDataSource.getArtical();
    try {
      Get.find<Logger>().i("Start `getArtical` in |HisnulMuminRepositoryImp|");
      var artical = await hisnulMuminLocalDataSource.getArtical();
      Get.find<Logger>().w(
          "End `getArtical` in |HisnulMuminRepositoryImp| ${artical.length}");
      return Right(artical);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getArtical` in |HisnulMuminRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }
}
