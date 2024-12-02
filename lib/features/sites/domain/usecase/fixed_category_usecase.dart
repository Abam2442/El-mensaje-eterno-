import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/repository/fixed_category_repo.dart';
import '../../../../core/errors/failures.dart';
import '../entities/fixed_entities.dart';

class FixedCategoryUsecase {
  final FixedCategoryRepository fixedRepository;
  FixedCategoryUsecase(
    this.fixedRepository,
  );
  Future<Either<Failure, List<CategoryFixedEntity>>> call() async {
    return fixedRepository.getCategoryArtical();
  }
}
