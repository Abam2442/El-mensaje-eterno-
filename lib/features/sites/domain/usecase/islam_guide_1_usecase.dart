import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/islam_guide_1_model.dart';
import '../repository/islam_guide_1_repository.dart';

class IslamGuide1UseCase {
  final IslamGuide1Repository islamGuide1Repository;
  IslamGuide1UseCase(
    this.islamGuide1Repository,
  );
  Future<Either<Failure, List<IslamGuide1>>> call() async {
    
    return islamGuide1Repository.getArtical();
  }
}
