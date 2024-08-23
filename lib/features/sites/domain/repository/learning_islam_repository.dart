import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/learning_islam_entities.dart';

abstract class LearningIslamRepository {
  Future<Either<Failure, List<LearningIslamEntities>>> getArtical();
}
