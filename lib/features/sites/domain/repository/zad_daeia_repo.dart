import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/zad_daeia_entity.dart';

abstract class ZadDaeiaRepository {
  Future<Either<Failure, List<ZadDaeiaEntity>>> getZads();
}
