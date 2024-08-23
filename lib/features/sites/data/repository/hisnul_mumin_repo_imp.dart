import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/repository/hisnul_mumin_repository.dart';
import '../data_source/hisnul_mumin_local_data_source.dart';
// import '../data_source/HisnulMumin_local_data_source.dart';

class HisnulMuminRepositoryImp extends HisnulMuminRepository {
  final HisnulMuminLocalDataSource hisnulMuminLocalDataSource;
  HisnulMuminRepositoryImp({
    required this.hisnulMuminLocalDataSource,
  });
  @override
  Future<Either<Failure, List<FixedEntities>>> getArtical() async {
    await hisnulMuminLocalDataSource.getArtical();
    try {
      var artical = await hisnulMuminLocalDataSource.getArtical();

      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
