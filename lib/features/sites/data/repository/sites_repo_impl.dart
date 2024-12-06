import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/core/helpers/get_failure_from_exception.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/data_source/remote_data_source/sites_remote_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/repository/sites_repository.dart';

class SitesRepoImp extends SitesRepository {
  final SitesRemoteDataSourceImpl _dataSourceImpl;

  SitesRepoImp({required SitesRemoteDataSourceImpl dataSourceImpl})
      : _dataSourceImpl = dataSourceImpl;

  @override
  Future<Either<Failure, List<FixedEntities>>> getOnlineData(
      fileName, sectionName) async {
    try {
      final response =
          await _dataSourceImpl.getOnlineData(fileName, sectionName);
      return Right(response);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
