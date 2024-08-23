import 'package:dartz/dartz.dart';
// import 'package:elresala/features/sites/data/models/the_key_to_islam_2_model.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/repository/the_key_to_islam_2_repo.dart';
import '../data_source/the_key_to_islam_2_local_datasource.dart';
import '../models/the_key_to_islam_2_model.dart';

class TheKeyToIslam2RepositoryImp extends TheKeyToIslam2Repo {
  final TheKeyToIslam2LocalDataSource theKeyToIslam2LocalDataSource;
  TheKeyToIslam2RepositoryImp({
    required this.theKeyToIslam2LocalDataSource,
  });
  @override
  Future<Either<Failure, List<TheKeyToIslam2>>> getArtical() async {
    await theKeyToIslam2LocalDataSource.getArtical();
    try {
      var artical = await theKeyToIslam2LocalDataSource.getArtical();

      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
