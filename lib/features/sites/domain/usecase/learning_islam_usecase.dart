import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/learning_islam_entities.dart';
import '../repository/learning_islam_repository.dart';

class LearningIslamUseCase {
  final LearningIslamRepository learningIslamRepository;
  LearningIslamUseCase(
    this.learningIslamRepository,
  );
  Future<Either<Failure, List<LearningIslamEntities>>> call() async {
    
    return await learningIslamRepository.getArtical();
  }
}
