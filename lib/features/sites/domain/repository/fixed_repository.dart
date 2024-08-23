import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/fixed_entities.dart';

abstract class FixedRepository {
  Future<Either<Failure, List<FixedEntities>>> getArtical();
}
