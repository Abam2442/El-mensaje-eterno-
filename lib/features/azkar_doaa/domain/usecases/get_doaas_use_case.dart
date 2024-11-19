import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/domain/repository/azkar_doaa_repo.dart';

import '../../data/models/doaa_model/doaa_model.dart';

class GetDoaasUseCase {
  final AzkarDoaaRepo azkarDoaaRepo;

  GetDoaasUseCase(this.azkarDoaaRepo);

  Future<Either<Failure, List<DoaaModel>>> call() async {
    return await azkarDoaaRepo.getDoaas();
  }
}
