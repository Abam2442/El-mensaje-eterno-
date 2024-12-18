import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';

abstract class FixedCategoryRepository {
  Future<Either<Failure, List<CategoryFixedEntity>>> getCategoryArtical();
  Future<Either<Failure, List<CategoryFixedEntity>>> getOnlineCategoryArtical();
}
