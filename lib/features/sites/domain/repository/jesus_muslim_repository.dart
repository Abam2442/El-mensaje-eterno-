import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/jesus_muslim_entities.dart';

abstract class JesusMuslimRepository {
  Future<Either<Failure, List<JesusMuslimEntities>>> getArtical();
}
