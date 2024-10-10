import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/islam_for_christians_entities.dart';
import '../repository/islam_for_christians_repository.dart';

class IslamForChristiansUseCase {
  final IslamForChristiansRepository islamForChristiansRepository;
  IslamForChristiansUseCase(
    this.islamForChristiansRepository,
  );

  Future<Either<Failure, List<IslamForChristiansEntities>>> call() async {
    
    return islamForChristiansRepository.getContent();
  }
}
