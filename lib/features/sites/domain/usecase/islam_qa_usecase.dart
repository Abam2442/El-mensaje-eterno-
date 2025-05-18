import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/islam_qa.dart';
import '../repository/islam_qa_repository.dart';

class IslamQAUseCase {
  final IslamQARepository islamQARepository;
  IslamQAUseCase(
    this.islamQARepository,
  );

  Future<Either<Failure, List<Islamqa>>> call() async {
    return await islamQARepository.getArtical();
  }
}
