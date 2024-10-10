import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/fixed_entities.dart';
import '../repository/human_rights_repository.dart';

class HumanRightsUseCase {
  final HumanRightsRepository humanRightsRepository;
  HumanRightsUseCase(
    this.humanRightsRepository,
  );
  Future<Either<Failure, List<FixedEntities>>> call() async {
    
    return humanRightsRepository.getArtical();
  }
}
