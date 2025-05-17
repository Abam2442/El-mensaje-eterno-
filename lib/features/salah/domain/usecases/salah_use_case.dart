import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/features/salah/data/model/tahara_lesson_model.dart';
import 'package:hiwayda_oracion_islamica/features/salah/domain/repository/salah_repo.dart';

class SalahUseCase {
  final SalahRepo _salahRepo;

  SalahUseCase(this._salahRepo);

  Future<Either<Failure, List<TaharaLessonModel>>> call() async {
    return await _salahRepo.getOfflineData();
  }
}
