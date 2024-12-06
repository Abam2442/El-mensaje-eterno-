import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/data_source/local_data_source/terminology_local_data_source.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/repository/fixed_repository.dart';

class TerminologyRepositoryImp extends FixedRepository {
  final TerminologyLocalDataSource terminologyLocalDataSource;
  TerminologyRepositoryImp({
    required this.terminologyLocalDataSource,
  });
  @override
  Future<Either<Failure, List<FixedEntities>>> getArtical() async {
    await terminologyLocalDataSource.getArtical();
    try {
      var artical = await terminologyLocalDataSource.getArtical();

      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
