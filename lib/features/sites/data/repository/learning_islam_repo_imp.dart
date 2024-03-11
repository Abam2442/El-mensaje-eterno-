import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
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
      Get.find<Logger>().i("Start `getArtical` in |LearningIslamRepositoryImp|");
      var artical = await learningIslamLocalDataSource.getArtical();
      Get.find<Logger>().w(
          "End `getArtical` in |LearningIslamRepositoryImp| ${artical.length}");
      return Right(artical);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getArtical` in |LearningIslamRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }
}

