import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/data/models/sonan_model.dart';

import '../../data/models/doaa_model/doaa_model.dart';
import '../entities/azkar_entity.dart';

abstract class AzkarDoaaRepo {
  Future<Either<Failure, List<Azkar>>> getAzkar();
  Future<Either<Failure, List<DoaaModel>>> getDoaas();
  Future<Either<Failure, Sonan>> getSonan();
}
