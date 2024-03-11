import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/islam_web_entities.dart';

abstract class IslamWebRepository {
  Future<Either<Failure, List<IslamWebEntities>>> getArtical();
}
