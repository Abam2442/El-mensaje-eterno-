import 'package:dartz/dartz.dart';
// import 'package:elresala/features/sites/domain/repository/the_key_to_islam_repo.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/the_key_to_islam_model.dart';
import '../repository/the_key_to_islam_repo.dart';

class TheKeyToIslamUseCase {
  final TheKeyToIslamRepo theKeyToIslamRepo;
  TheKeyToIslamUseCase(
    this.theKeyToIslamRepo,
  );
  Future<Either<Failure, List<TheKeyToIslamfirst>>> call() async {
    
    return theKeyToIslamRepo.getArtical();
  }
}
