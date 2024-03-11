import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../entities/fixed_entities.dart';
import '../repository/islam_house_repository.dart';

class IslamHouseUseCase {
  final IslamHouseRepository islamHouseRepository;
  IslamHouseUseCase(
    this.islamHouseRepository,
  );

  Future<Either<Failure, List<List<FixedEntities>>>> call() async {
    Get.find<Logger>().i("Call IslamHouseUseCase");
    return islamHouseRepository.getContent();
  }
}
