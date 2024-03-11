import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/core/helpers/get_failure_from_exception.dart';
import 'package:hiwayda_oracion_islamica/features/non_muslim/data/data_sources/non_muslim_local_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/non_muslim/data/data_sources/non_muslim_remote_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/non_muslim/data/models/course_model.dart';
import 'package:hiwayda_oracion_islamica/features/non_muslim/domain/repository/non_muslim_repo.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class NonMuslimRepoImpl implements NonMuslimRepo {
  final NonMuslimRemoteDataSource nonMuslimRemoteDataSource;
  final NonMuslimLocalDataSource nonMuslimLocalDataSource;

  const NonMuslimRepoImpl({
    required this.nonMuslimRemoteDataSource,
    required this.nonMuslimLocalDataSource,
  });

  @override
  Future<Either<Failure, List<NonMuslimModel>>> getCourses() async {
    try {
      Get.find<Logger>().i("Start `getCourses` in |NonMuslimRepoImpl|");
      var hadithes = await nonMuslimLocalDataSource.getCourses();
      Get.find<Logger>().w("End `getCourses` in |NonMuslimRepoImpl| ${hadithes.length}");
      return Right(hadithes);
    } catch (e) {
      Get.find<Logger>().e("End `getCourses` in |NonMuslimRepoImpl| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }
}
