import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/saber_el_islam_model.dart';
import '../repository/saber_el_islam_repository.dart';

class SaberElIslamUseCase {
  final SaberElIslamRepository saberElIslamRepository;
  SaberElIslamUseCase(
    this.saberElIslamRepository,
  );
  Future<Either<Failure, List<SaberElIslamModel>>> call() async {
    
    return await saberElIslamRepository.getArtical();
  }
}
