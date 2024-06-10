import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';

import '../entities/islam_religion_entities.dart';
import '../repository/islam_religion_repository.dart';

class IslamReligionUseCase {
  final IslamReligionRepository islamReligionRepository;
  IslamReligionUseCase(
    this.islamReligionRepository,
  );

  Future<Either<Failure, List<IslamReligionEntities>>> call() async {
    
    return islamReligionRepository.getContent();
  }
}
