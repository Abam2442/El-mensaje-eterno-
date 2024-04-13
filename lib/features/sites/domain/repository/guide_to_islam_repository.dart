import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/fixed_entities.dart';

abstract class GuideToIslamRepository {
  Future<Either<Failure, List<List<FixedEntities>>>> getContent();
}
