import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/fixed_entities.dart';

abstract class HumanRightsRepository {
  Future<Either<Failure, List<FixedEntities>>> getArtical();
}
