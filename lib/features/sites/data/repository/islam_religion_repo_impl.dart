import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/islam_religion_entities.dart';
import '../../domain/repository/islam_religion_repository.dart';
import '../data_source/islam_religion_local_data_source.dart';

class IslamReligionRepositoryImp extends IslamReligionRepository {
  final IslamReligionLocalDataSource islamReligionLocalDataSource;
  IslamReligionRepositoryImp({
    required this.islamReligionLocalDataSource,
  });
  @override
  Future<Either<Failure, List<IslamReligionEntities>>> getContent() async {
    await islamReligionLocalDataSource.getContent();
    try {
      var artical = await islamReligionLocalDataSource.getContent();

      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
