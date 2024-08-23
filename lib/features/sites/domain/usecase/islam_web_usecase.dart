import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/islam_web_entities.dart';
import '../repository/islam_web_repository.dart';

class IslamWebUseCase {
  final IslamWebRepository islamWebRepository;
  IslamWebUseCase(
    this.islamWebRepository,
  );
  Future<Either<Failure, List<IslamWebEntities>>> call() async {
    
    return islamWebRepository.getArtical();
  }
}
