import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../entities/fixed_entities.dart';
import '../repository/guide_to_islam_repository.dart';

class GuideToIslamUseCase {
  final GuideToIslamRepository islamRepository;
  GuideToIslamUseCase(
    this.islamRepository,
  );

  Future<Either<Failure, List<List<FixedEntities>>>> callContent() async {
    Get.find<Logger>().i("Call GuideToIslamUseCase");
    return islamRepository.getContent();
  }

  Future<Either<Failure, List<MediaEntity>>> getBooks() async {
    Get.find<Logger>().i(" Call GuideToIslamUseCase");
    return islamRepository.getBooks();
  }

  Future<Either<Failure, List<MediaEntity>>> getAudios() async {
    Get.find<Logger>().i("Call GuideToIslamUseCase");
    return islamRepository.getAudios();
  }
}
