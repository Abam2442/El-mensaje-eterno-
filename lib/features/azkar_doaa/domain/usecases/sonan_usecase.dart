import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/data/models/sonan_model.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/domain/repository/azkar_doaa_repo.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class GetSonanUseCase {
  final AzkarDoaaRepo azkarDoaaRepo;

  GetSonanUseCase(this.azkarDoaaRepo);

  Future<Either<Failure, Sonan>> call() async {
    Get.find<Logger>().i("Call GetSonanaUseCase");
    return await azkarDoaaRepo.getSonan();
  }
}
