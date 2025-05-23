import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import '../../../../core/errors/failures.dart';
import '../entities/islam_land_entities.dart';
import '../repository/islam_land_repository.dart';

class IslamLandUseCase {
  final IslamLandRepository islamLandRepository;
  IslamLandUseCase(
    this.islamLandRepository,
  );
  Future<Either<Failure, List<List<FixedEntities>>>> call() async {
    return await islamLandRepository.getContent();
  }

  Future<Either<Failure, List<IslamLandFatwaEntities>>>
      callOfflineFatwa() async {
    return await islamLandRepository.getOfflineFatwa();
  }

  Future<Either<Failure, List<MediaEntity>>> callOnlineFatwa() async {
    return await islamLandRepository.getOnlineFatwa();
  }

  Future<Either<Failure, Map<String, List<MediaEntity>>>> callBooks() async {
    return await islamLandRepository.getBooks();
  }

  Future<Either<Failure, List<MediaEntity>>> callAudios() async {
    return await islamLandRepository.getAudio();
  }

  Future<Either<Failure, List<MediaEntity>>> callVideos() async {
    return await islamLandRepository.getVideos();
  }
}
