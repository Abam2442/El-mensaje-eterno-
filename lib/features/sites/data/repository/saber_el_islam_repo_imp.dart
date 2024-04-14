import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/repository/saber_el_islam_repository.dart';
import '../data_source/saber_el_islam_local_data_source.dart';
import '../models/saber_el_islam_model.dart';

class SaberElIslamRepositoryImp extends SaberElIslamRepository {
  final SaberElIslamLocalDataSource saberElIslamLocalDataSource;
  SaberElIslamRepositoryImp({
    required this.saberElIslamLocalDataSource,
  });
  @override
  Future<Either<Failure, List<SaberElIslamModel>>> getArtical() async {
    await saberElIslamLocalDataSource.getArtical();
    try {
      Get.find<Logger>().i("Start `getArtical` in |SaberElIslamRepositoryImp|");
      var artical = await saberElIslamLocalDataSource.getArtical();
      Get.find<Logger>().w(
          "End `getArtical` in |SaberElIslamRepositoryImp| ${artical.length}");
      return Right(artical);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getArtical` in |SaberElIslamRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }
}
