import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/core/helpers/get_failure_from_exception.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/data/data_sources/azkar_doaa_local_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/data/models/sonan_model.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/domain/entities/azkar_entity.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/domain/repository/azkar_doaa_repo.dart';

import '../models/doaa_model/doaa_model.dart';

class AzkarDoaaRepoImpl implements AzkarDoaaRepo {
  // final AzkarDoaaRemoteDataSource azkarRemoteDataSource;
  final AzkarDoaaLocalDataSource azkarLocalDataSource;

  const AzkarDoaaRepoImpl({
    // required this.azkarRemoteDataSource,
    required this.azkarLocalDataSource,
  });

  @override
  Future<Either<Failure, List<Azkar>>> getAzkar() async {
    try {
      var azkar = await azkarLocalDataSource.getAzkar();

      return Right(azkar);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<DoaaModel>>> getDoaas() async {
    try {
      var doaas = await azkarLocalDataSource.getDoaas();

      return Right(doaas);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, Sonan>> getSonan() async {
    try {
      var doaas = await azkarLocalDataSource.getSonan();

      return Right(doaas);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
