import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../entities/islam_land_entities.dart';
import '../repository/islam_land_repository.dart';

class IslamLandUseCase {
  final IslamLandRepository islamLandRepository;
  IslamLandUseCase(
    this.islamLandRepository,
  );
  Future<Either<Failure, List<List<FixedEntities>>>> call() async {
    Get.find<Logger>().i("Call FixedUseCase");
    return islamLandRepository.getContent();
  }

  Future<Either<Failure, List<IslamLandFatwaEntities>>> callFatwa() async {
    Get.find<Logger>().i("Call IslamLandUseCase");
    return islamLandRepository.getFatwa();
  }
}
