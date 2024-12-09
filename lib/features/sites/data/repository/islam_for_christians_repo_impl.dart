import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/data_source/local_data_source/islam_for_christians_local_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/data_source/remote_data_source/islam_for_chrictians_remote_data_source.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/islam_for_christians_entities.dart';
import '../../domain/repository/islam_for_christians_repository.dart';

class IslamForChristiansRepositoryImp extends IslamForChristiansRepository {
  final IslamForChristiansLocalDataSource islamForChristiansLocalDataSource;
  final IslamForChrictiansRemoteDataSource _chrictiansRemoteDataSource;
  IslamForChristiansRepositoryImp(
    this._chrictiansRemoteDataSource, {
    required this.islamForChristiansLocalDataSource,
  });
  @override
  Future<Either<Failure, List<IslamForChristiansEntities>>> getContent() async {
    try {
      var artical = await islamForChristiansLocalDataSource.getContent();

      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<IslamForChristiansEntities>>>
      getOnlineContent() async {
    try {
      final response = await _chrictiansRemoteDataSource.getOnlineContent();
      return Right(response);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
