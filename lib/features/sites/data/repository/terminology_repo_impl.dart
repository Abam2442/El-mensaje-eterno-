import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/repository/fixed_category_repo.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/repository/fixed_repository.dart';
import '../data_source/terminology_local_data_source.dart';

class TerminologyRepositoryImp extends FixedCategoryRepository {
  final TerminologyLocalDataSource terminologyLocalDataSource;
  TerminologyRepositoryImp({
    required this.terminologyLocalDataSource,
  });
  @override
  Future<Either<Failure, List<CategoryFixedEntity>>>
      getCategoryArtical() async {
    await terminologyLocalDataSource.getArtical();
    try {
      var artical = await terminologyLocalDataSource.getArtical();

      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
