import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/core/helpers/get_failure_from_exception.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/data/data_sources/hadith_local_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/data/data_sources/hadith_remote_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/data/models/hadith_model.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/domain/repository/hadith_repo.dart';

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
      
      SunnahHadithModel sunnahHadithes = await hadithLocalDataSource.getSunnahHadithes();
      
      return Right(sunnahHadithes);
    } catch (e) {
      
      return Left(getFailureFromException(e));
    }
  }

    @override
  Future<Either<Failure, HaditencHadithModel>> getHadithencHadithes() async {
    try {
      
      var hadithes = await hadithLocalDataSource.getHadithencHadithes();
      
      return Right(hadithes);
    } catch (e) {
      
      return Left(getFailureFromException(e));
    }
  }
}
