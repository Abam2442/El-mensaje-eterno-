import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/core/helpers/get_failure_from_exception.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/data/data_sources/azkar_doaa_local_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/data/data_sources/azkar_doaa_remote_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/data/models/sonan_model.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/domain/entities/azkar_entity.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/domain/repository/azkar_doaa_repo.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../models/doaa_model/doaa_model.dart';

class AzkarDoaaRepoImpl implements AzkarDoaaRepo {
  final AzkarDoaaRemoteDataSource azkarRemoteDataSource;
  final AzkarDoaaLocalDataSource azkarLocalDataSource;

  const AzkarDoaaRepoImpl({
    required this.azkarRemoteDataSource,
    required this.azkarLocalDataSource,
  });

  @override
  Future<Either<Failure, List<Azkar>>> getAzkar() async {
    try {
      Get.find<Logger>().i("Start `getAzkars` in |AzkarRepoImpl|");
      var azkar = await azkarLocalDataSource.getAzkar();
      Get.find<Logger>()
          .w("End `getAzkars` in |AzkarRepoImpl| ${azkar.length}");
      return Right(azkar);
    } catch (e) {
      Get.find<Logger>()
          .e("End `getAzkars` in |AzkarRepoImpl| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<DoaaModel>>> getDoaas() async {
    try {
      Get.find<Logger>().i("Start `getDoaas` in |DoaaRepoImpl|");
      var doaas = await azkarLocalDataSource.getDoaas();
      Get.find<Logger>().w("End `getDoaas` in |DoaaRepoImpl| $doaas");
      return Right(doaas);
    } catch (e) {
      Get.find<Logger>()
          .e("End `getDoaas` in |DoaaRepoImpl| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, Sonan>> getSonan() async {
    try {
      Get.find<Logger>().i("Start `getSonan` in |SonanRepoImpl|");
      var doaas = await azkarLocalDataSource.getSonan();
      Get.find<Logger>().w("End `getSonan` in |SonanRepoImpl| $doaas");
      return Right(doaas);
    } catch (e) {
      Get.find<Logger>()
          .e("End `getSonan` in |SonanRepoImpl| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }
}
