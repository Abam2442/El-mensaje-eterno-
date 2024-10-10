import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/repository/learning_islam_repository.dart';
import '../data_source/learning_islam_local_data_source.dart';
import '../models/learning_islam_model.dart';

class LearningIslamRepositoryImp extends LearningIslamRepository {
  final LearningIslamLocalDataSource learningIslamLocalDataSource;
  LearningIslamRepositoryImp({
    required this.learningIslamLocalDataSource,
  });
  @override
  Future<Either<Failure, List<LearningIslamModel>>> getArtical() async {
    await learningIslamLocalDataSource.getArtical();
    try {
      var artical = await learningIslamLocalDataSource.getArtical();

      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
