import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../entities/learning_islam_entities.dart';
import '../repository/learning_islam_repository.dart';

class LearningIslamUseCase {
  final LearningIslamRepository learningIslamRepository;
  LearningIslamUseCase(
    this.learningIslamRepository,
  );
  Future<Either<Failure, List<LearningIslamEntities>>> call() async {
    Get.find<Logger>().i("Call LearningIslamUseCase");
    return await learningIslamRepository.getArtical();
  }
}
