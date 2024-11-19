import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/core/helpers/get_failure_from_exception.dart';
import 'package:hiwayda_oracion_islamica/features/non_muslim/data/data_sources/non_muslim_local_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/non_muslim/data/data_sources/non_muslim_remote_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/non_muslim/data/models/course_model.dart';
import 'package:hiwayda_oracion_islamica/features/non_muslim/domain/repository/non_muslim_repo.dart';

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
      var hadithes = await nonMuslimLocalDataSource.getCourses();

      return Right(hadithes);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
