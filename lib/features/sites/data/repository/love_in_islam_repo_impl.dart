import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/repository/fixed_repository.dart';
import '../data_source/love_in_islam_local_data_source.dart';

class LoveInIslamRepositoryImp extends FixedRepository {
  final LoveInIslamLocalDataSource loveInIslamLocalDataSource;
  LoveInIslamRepositoryImp({
    required this.loveInIslamLocalDataSource,
  });
  @override
  Future<Either<Failure, List<FixedEntities>>> getArtical() async {
    await loveInIslamLocalDataSource.getArtical();
    try {
      var artical = await loveInIslamLocalDataSource.getArtical();

      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
