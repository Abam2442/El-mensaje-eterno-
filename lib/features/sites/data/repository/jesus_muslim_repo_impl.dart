import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/data_source/local_data_source/jesus_muslim_local_data_source.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/jesus_muslim_entities.dart';
import '../../domain/repository/jesus_muslim_repository.dart';

class JesusMuslimRepositoryImp extends JesusMuslimRepository {
  final JesusMuslimLocalDataSource jesusMuslimLocalDataSource;
  JesusMuslimRepositoryImp({
    required this.jesusMuslimLocalDataSource,
  });
  @override
  Future<Either<Failure, List<JesusMuslimEntities>>> getArtical() async {
    await jesusMuslimLocalDataSource.getArtical();
    try {
      var artical = await jesusMuslimLocalDataSource.getArtical();

      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
