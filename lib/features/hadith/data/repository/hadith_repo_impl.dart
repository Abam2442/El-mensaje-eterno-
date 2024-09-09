import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/core/helpers/get_failure_from_exception.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/data/data_sources/hadith_local_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/data/data_sources/hadith_remote_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/data/models/hadith_model.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/domain/repository/hadith_repo.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class HadithRepoImpl implements HadithRepo {
  final HadithRemoteDataSource hadithRemoteDataSource;
  final HadithLocalDataSource hadithLocalDataSource;

  const HadithRepoImpl({
    required this.hadithRemoteDataSource,
    required this.hadithLocalDataSource,
  });

  @override
  Future<Either<Failure, SunnahHadithModel>> getSunnahHadithes() async {
    try {
      Get.find<Logger>().i("Start `getHadithes` in |HadithRepoImpl|");
      SunnahHadithModel sunnahHadithes = await hadithLocalDataSource.getSunnahHadithes();
      Get.find<Logger>().w("End `getHadithes` in |HadithRepoImpl| $sunnahHadithes");
      return Right(sunnahHadithes);
    } catch (e) {
      Get.find<Logger>().e("End `getHadithes` in |HadithRepoImpl| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }

    @override
  Future<Either<Failure, HaditencHadithModel>> getHadithencHadithes() async {
    try {
      Get.find<Logger>().i("Start `getHadithes` in |HadithRepoImpl|");
      var hadithes = await hadithLocalDataSource.getHadithencHadithes();
      Get.find<Logger>().w("End `getHadithes` in |HadithRepoImpl| $hadithes");
      return Right(hadithes);
    } catch (e) {
      Get.find<Logger>().e("End `getHadithes` in |HadithRepoImpl| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }
}
