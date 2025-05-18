import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/core/helpers/get_failure_from_exception.dart';
import 'package:hiwayda_oracion_islamica/features/salah/data/data_source/salah_local_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/salah/data/model/tahara_lesson_model.dart';
import 'package:hiwayda_oracion_islamica/features/salah/domain/repository/salah_repo.dart';

class SalahRepoImpl extends SalahRepo {
  final SalahLocalDataSource _salahLocalDataSource;

  SalahRepoImpl(this._salahLocalDataSource, );

  @override
  Future<Either<Failure, List<TaharaLessonModel>>> getOfflineData() async {
    try {
      final response = await _salahLocalDataSource.getOfflineData();
      return Right(response);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }}
