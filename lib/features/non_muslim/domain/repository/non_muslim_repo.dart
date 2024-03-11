import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/features/non_muslim/data/models/course_model.dart';

abstract class NonMuslimRepo {
  Future<Either<Failure, List<NonMuslimModel>>> getCourses();
}
