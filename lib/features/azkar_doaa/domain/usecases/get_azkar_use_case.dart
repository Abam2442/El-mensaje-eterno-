import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/domain/repository/azkar_doaa_repo.dart';

import '../entities/azkar_entity.dart';

class GetAzkarUseCase {
  final AzkarDoaaRepo azkarDoaaRepo;

  GetAzkarUseCase(this.azkarDoaaRepo);

  Future<Either<Failure, List<Azkar>>> call() async {
    return await azkarDoaaRepo.getAzkar();
  }
}
