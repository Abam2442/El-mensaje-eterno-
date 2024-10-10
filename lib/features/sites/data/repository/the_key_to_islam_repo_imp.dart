import 'package:dartz/dartz.dart';
// import 'package:elresala/features/sites/data/data_source/the_key_to_islam_local_date_source.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/repository/the_key_to_islam_repo.dart';
import '../data_source/the_key_to_islam_local_date_source.dart';
import '../models/the_key_to_islam_model.dart';

class TheKeyToIslamRepositoryImp extends TheKeyToIslamRepo {
  final TheKeyToIslamLocalDataSource theKeyToIslamLocalDataSource;
  TheKeyToIslamRepositoryImp({
    required this.theKeyToIslamLocalDataSource,
  });
  @override
  Future<Either<Failure, List<TheKeyToIslamfirst>>> getArtical() async {
    await theKeyToIslamLocalDataSource.getArtical();
    try {
      var artical = await theKeyToIslamLocalDataSource.getArtical();

      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
