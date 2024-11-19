import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import '../../../../core/errors/failures.dart';
import '../entities/fixed_entities.dart';
import '../repository/guide_to_islam_repository.dart';

class GuideToIslamUseCase {
  final GuideToIslamRepository islamRepository;
  GuideToIslamUseCase(
    this.islamRepository,
  );

  Future<Either<Failure, List<FixedEntities>>> callContent() async {
    return islamRepository.getContent();
  }

  Future<Either<Failure, List<MediaEntity>>> getBooks() async {
    return islamRepository.getBooks();
  }

  Future<Either<Failure, List<MediaEntity>>> getAudios() async {
    return islamRepository.getAudios();
  }

  Future<Either<Failure, List<MediaEntity>>> getVideos() async {
    return islamRepository.getVideos();
  }
}
