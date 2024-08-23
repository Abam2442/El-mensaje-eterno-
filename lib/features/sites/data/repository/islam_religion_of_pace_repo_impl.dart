import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/repository/fixed_repository.dart';
import '../data_source/islam_religion_of_pace_local_data_source.dart';

class IslamReligionOfPaceRepositoryImp extends FixedRepository {
  final IslamReligionOfPaceLocalDataSource islamReligionOfPaceLocalDataSource;
  IslamReligionOfPaceRepositoryImp({
    required this.islamReligionOfPaceLocalDataSource,
  });
  @override
  Future<Either<Failure, List<FixedEntities>>> getArtical() async {
    await islamReligionOfPaceLocalDataSource.getArtical();
    try {
      var artical = await islamReligionOfPaceLocalDataSource.getArtical();

      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
