import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/islam_for_christians_entities.dart';

abstract class IslamForChristiansRepository {
  Future<Either<Failure, List<IslamForChristiansEntities>>> getContent();
}
