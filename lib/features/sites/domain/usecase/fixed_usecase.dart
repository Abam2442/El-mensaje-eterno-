import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/fixed_entities.dart';
import '../repository/fixed_repository.dart';

class FixedUseCase {
  final FixedRepository fixedRepository;
  FixedUseCase(
    this.fixedRepository,
  );
  Future<Either<Failure, List<FixedEntities>>> call() async {
    
    return fixedRepository.getArtical();
  }
}
