import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/core/helpers/get_failure_from_exception.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/data/data_sources/hadith_local_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/data/data_sources/hadith_remote_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/data/models/hadith_model.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/domain/repository/hadith_repo.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/model/sunnah_data_model.dart';
import 'package:logger/logger.dart';

class HadithRepoImpl implements HadithRepo {
  final HadithLocalDataSource hadithLocalDataSource;
  final HadithRemoteDataSource hadithRemoteDataSource;

  const HadithRepoImpl({
    required this.hadithRemoteDataSource,
    required this.hadithLocalDataSource,
  });

  @override
  Future<Either<Failure, List<SunnahHadithModel>>> getHadithes() async {
    try {
      Get.find<Logger>().i("Start `getHadithes` in |HadithRepoImpl|");
      List<SunnahHadithModel> sunnahHadithes =
          await hadithLocalDataSource.getHadithes();
      Get.find<Logger>()
          .w("End `getHadithes` in |HadithRepoImpl| $sunnahHadithes");
      return Right(sunnahHadithes);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getHadithes` in |HadithRepoImpl| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<SunnahDataModel>>> getSunnah(String path) async {
    try {
      List<SunnahDataModel> sunnahData =
          await hadithLocalDataSource.getSunnah(path);
      return Right(sunnahData);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<SunnahHadithModel>>> getOnlineHadithData() async {
    try {
      List<SunnahHadithModel> sunnahData =
          await hadithRemoteDataSource.getOnlineHadithData();
      return Right(sunnahData);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<SunnahDataModel>>> getOnlineSunnahData(
      String path) async {
    try {
      List<SunnahDataModel> sunnahData =
          await hadithRemoteDataSource.getOnlineSunnahData(path);
      return Right(sunnahData);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  // @override
  // Future<Either<Failure, HaditencHadithModel>> getHadithencHadithes() async {
  //   try {
  //     Get.find<Logger>().i("Start `getHadithes` in |HadithRepoImpl|");
  //     var hadithes = await hadithLocalDataSource.getHadithencHadithes();
  //     Get.find<Logger>().w("End `getHadithes` in |HadithRepoImpl| $hadithes");
  //     return Right(hadithes);
  //   } catch (e) {
  //     Get.find<Logger>().e(
  //         "End `getHadithes` in |HadithRepoImpl| Exception: ${e.runtimeType}");
  //     return Left(getFailureFromException(e));
  //   }
  // }
}
