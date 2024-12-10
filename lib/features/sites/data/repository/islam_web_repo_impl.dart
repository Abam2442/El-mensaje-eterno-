import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/data_source/local_data_source/islam_web_local_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/data_source/remote_data_source/islam_web_remote_data_source.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/islam_web_entities.dart';
import '../../domain/repository/islam_web_repository.dart';

class IslamWebRepositoryImp extends IslamWebRepository {
  final IslamWebLocalDataSource islamWebLocalDataSource;
  final IslamWebRemoteDataSource _dataSource;
  IslamWebRepositoryImp(
    this._dataSource, {
    required this.islamWebLocalDataSource,
  });
  @override
  Future<Either<Failure, List<IslamWebEntities>>> getArtical() async {
    try {
      var artical = await islamWebLocalDataSource.getArtical();

      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<IslamWebEntities>>> getOnlineArtical() async {
    try {
      final response = await _dataSource.getOnlineArtical();
      return Right(response);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
