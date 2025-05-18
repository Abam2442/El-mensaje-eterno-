import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/repository/rasuluallh_repository_repository.dart';
import '../../../../core/errors/failures.dart';

class RasuluallahUseCase {
  final RasuluallhRepository repository;
  RasuluallahUseCase(
    this.repository,
  );

  Future<Either<Failure, List<CategoryFixedEntity>>> call() async {
    return await repository.getContent();
  }

  Future<Either<Failure, List<MediaEntity>>> getAudios() async {
    return await repository.getAudios();
  }

  Future<Either<Failure, List<MediaCategoryEntity>>> getVideos() async {
    return await repository.getVideos();
  }
}
