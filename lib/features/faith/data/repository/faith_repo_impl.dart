import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/core/helpers/get_failure_from_exception.dart';
import 'package:hiwayda_oracion_islamica/features/faith/data/data_source/faith_local_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/faith/data/data_source/faith_remote_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/faith/data/model/faithModel.dart';
import 'package:hiwayda_oracion_islamica/features/faith/domain/repository/faith_repo.dart';

class FaithRepoImpl extends FaithRepo {
  final FaithLocalDataSource _faithLocalDataSource;
  final FaithRemoteDataSource _faithRemoteDataSource;

  FaithRepoImpl(this._faithLocalDataSource, this._faithRemoteDataSource);

  @override
  Future<Either<Failure, FaithModel>> getOfflineData() async {
    try {
      return Right(await _faithLocalDataSource.getOfflineData());
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, FaithModel>> getOnlineData() async {
    try {
      return Right(await _faithRemoteDataSource.getOnlineData());
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
