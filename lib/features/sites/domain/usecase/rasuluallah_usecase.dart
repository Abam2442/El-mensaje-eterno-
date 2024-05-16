import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/repository/rasuluallh_repository_repository.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../entities/islam_religion_entities.dart';
import '../repository/islam_religion_repository.dart';

class RasuluallahUseCase {
  final RasuluallhRepository repository;
  RasuluallahUseCase(
    this.repository,
  );

  Future<Either<Failure, List<IslamReligionEntities>>> call() async {
    Get.find<Logger>().i("Call RasuluallahUseCase");
    return repository.getContent();
  }

  Future<Either<Failure, List<MediaEntity>>> getAudios() async {
    Get.find<Logger>().i("Call RasuluallahUseCase");
    return repository.getAudios();
  }

  Future<Either<Failure, List<MediaCategoryEntity>>> getVideos() async {
    Get.find<Logger>().i("Call RasuluallahUseCase");
    return repository.getVideos();
  }
}
