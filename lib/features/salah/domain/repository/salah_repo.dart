import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/features/salah/data/model/tahara_lesson_model.dart';

abstract class SalahRepo {
  Future<Either<Failure, List<TaharaLessonModel>>> getOfflineData();
}
