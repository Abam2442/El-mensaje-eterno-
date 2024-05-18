import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
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

  Future<Either<Failure, List<MediaEntity>>> getBooks() async {
    Get.find<Logger>().i("Call IslamHouseUseCase");
    return islamHouseRepository.getBooks();
  }

  Future<Either<Failure, List<FixedEntities>>> getFatwa() async {
    Get.find<Logger>().i("Call IslamHouseUseCase");
    return islamHouseRepository.getFatwa();
  }
}
