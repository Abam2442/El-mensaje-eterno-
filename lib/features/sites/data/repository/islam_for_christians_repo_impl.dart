import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/islam_for_christians_entities.dart';
import '../../domain/repository/islam_for_christians_repository.dart';
import '../data_source/islam_for_christians_local_data_source.dart';

class IslamForChristiansRepositoryImp extends IslamForChristiansRepository {
  final IslamForChristiansLocalDataSource islamForChristiansLocalDataSource;
  IslamForChristiansRepositoryImp({
    required this.islamForChristiansLocalDataSource,
  });
  @override
  Future<Either<Failure, List<IslamForChristiansEntities>>> getContent() async {
    await islamForChristiansLocalDataSource.getContent();
    try {
      var artical = await islamForChristiansLocalDataSource.getContent();

      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
