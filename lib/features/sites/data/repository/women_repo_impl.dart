import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/repository/fixed_repository.dart';
import '../data_source/women_local_data_source.dart';

class WomanRepositoryImp extends FixedRepository {
  final WomenLocalDataSource womenLocalDataSource;
  WomanRepositoryImp({
    required this.womenLocalDataSource,
  });
  @override
  Future<Either<Failure, List<FixedEntities>>> getArtical() async {
    await womenLocalDataSource.getArtical();
    try {
      var artical = await womenLocalDataSource.getArtical();

      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
