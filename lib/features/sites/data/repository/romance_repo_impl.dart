import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/repository/fixed_repository.dart';
import '../data_source/romance_local_data_source.dart';

class RomanceRepositoryImp extends FixedRepository {
  final RomanceLocalDataSource romanceLocalDataSource;
  RomanceRepositoryImp({
    required this.romanceLocalDataSource,
  });
  @override
  Future<Either<Failure, List<FixedEntities>>> getArtical() async {
    await romanceLocalDataSource.getArtical();
    try {
      var artical = await romanceLocalDataSource.getArtical();

      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
