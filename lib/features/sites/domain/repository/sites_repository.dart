import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';

abstract class SitesRepository {
  Future<Either<Failure, List<FixedEntities>>> getOnlineData(
      fileName, sectionName);
}
