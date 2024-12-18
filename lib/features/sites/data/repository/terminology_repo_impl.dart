import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/data_source/local_data_source/terminology_local_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/data_source/remote_data_source/terminology_remote_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/repository/terminology_repo.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/fixed_entities.dart';

class TerminologyRepositoryImp extends FixedCategoryRepository {
  final TerminologyLocalDataSource terminologyLocalDataSource;
  final TerminologyRemoteDataSource _terminologyRemoteDataSource;
  TerminologyRepositoryImp(
    this._terminologyRemoteDataSource, {
    required this.terminologyLocalDataSource,
  });
  @override
  Future<Either<Failure, List<CategoryFixedEntity>>>
      getCategoryArtical() async {
    // await terminologyLocalDataSource.getArtical();
    try {
      var artical = await terminologyLocalDataSource.getArtical();

      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<CategoryFixedEntity>>>
      getOnlineCategoryArtical() async {
    try {
      final response = await _terminologyRemoteDataSource.getOnlineArtical();
      return Right(response);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
