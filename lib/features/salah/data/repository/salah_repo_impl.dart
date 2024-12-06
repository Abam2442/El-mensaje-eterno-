import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/core/helpers/get_failure_from_exception.dart';
import 'package:hiwayda_oracion_islamica/features/salah/data/data_source/salah_local_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/salah/data/data_source/salah_remote_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/salah/data/model/tahara_lesson_model.dart';
import 'package:hiwayda_oracion_islamica/features/salah/domain/repository/salah_repo.dart';

class SalahRepoImpl extends SalahRepo {
  final SalahLocalDataSource _salahLocalDataSource;
  final SalahRemoteDataSource _salahRemoteDataSource;

  SalahRepoImpl(this._salahLocalDataSource, this._salahRemoteDataSource);

  @override
  Future<Either<Failure, List<TaharaLessonModel>>> getOfflineData() async {
    try {
      final response = await _salahLocalDataSource.getOfflineData();
      return Right(response);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<TaharaLessonModel>>> getOnlineData() async {
    try {
      final response = await _salahRemoteDataSource.getOnlineData();
      return Right(response);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
