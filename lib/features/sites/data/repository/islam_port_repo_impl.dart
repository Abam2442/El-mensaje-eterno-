import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/repository/fixed_repository.dart';
import '../data_source/islam_port_local_data_source.dart';

class IslamPortRepositoryImp extends FixedRepository {
  final IslamPortLocalDataSource islamPortLocalDataSource;
  IslamPortRepositoryImp({
    required this.islamPortLocalDataSource,
  });
  @override
  Future<Either<Failure, List<FixedEntities>>> getArtical() async {
    await islamPortLocalDataSource.getArtical();
    try {
      var artical = await islamPortLocalDataSource.getArtical();

      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
