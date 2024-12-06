import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/data_source/local_data_source/explore_islam_local_data_source.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/repository/fixed_repository.dart';

class ExploreIslamRepositoryImp extends FixedRepository {
  final ExploreIslamLocalDataSource exploreIslamLocalDataSource;
  ExploreIslamRepositoryImp({
    required this.exploreIslamLocalDataSource,
  });
  @override
  Future<Either<Failure, List<FixedEntities>>> getArtical() async {
    await exploreIslamLocalDataSource.getArtical();
    try {
      var artical = await exploreIslamLocalDataSource.getArtical();

      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
