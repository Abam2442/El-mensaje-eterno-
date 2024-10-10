import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/islam_religion_entities.dart';

abstract class IslamReligionRepository {
  Future<Either<Failure, List<IslamReligionEntities>>> getContent();
}
