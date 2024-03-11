import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/domain/entities/doaa_entity.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/domain/repository/azkar_doaa_repo.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class GetDoaasUseCase {
  final AzkarDoaaRepo azkarDoaaRepo;

  GetDoaasUseCase(this.azkarDoaaRepo);

  Future<Either<Failure, Doaa>> call() async {
    Get.find<Logger>().i("Call GetDoaasUseCase");
    return await azkarDoaaRepo.getDoaas();
  }
}
