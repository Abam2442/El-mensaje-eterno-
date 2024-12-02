import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/core/helpers/get_failure_from_exception.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/data_source/zad_daeia_local_datasource.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/zad_daeia_entity.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/repository/zad_daeia_repo.dart';

class ZadDaeyaRepositoryImpl implements ZadDaeiaRepository {
  final ZadDaeiaLocalDatasource localDatasource;

  ZadDaeyaRepositoryImpl({
    required this.localDatasource,
  });
  @override
  Future<Either<Failure, List<ZadDaeiaEntity>>> getZads() async {
    try {
      var hadithes = await localDatasource.getZads();

      return Right(hadithes);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
