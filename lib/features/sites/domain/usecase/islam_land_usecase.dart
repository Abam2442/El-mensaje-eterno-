import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/check_offline_files.dart';
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
    return await checkOfflineFiles(AppKeys.islamLand)
        ? await islamLandRepository.getContent()
        : await islamLandRepository.getOnlineContent();
  }

  Future<Either<Failure, List<IslamLandFatwaEntities>>>
      callOfflineFatwa() async {
    return await checkOfflineFiles(AppKeys.islamLandFatwa)
        ? await islamLandRepository.getOfflineFatwa()
        : await islamLandRepository.getNetOfflineFatwa();
  }

  Future<Either<Failure, List<MediaEntity>>> callOnlineFatwa() async {
    return await checkOfflineFiles(AppKeys.islamLandFatwa)
        ? await islamLandRepository.getOnlineFatwa()
        : await islamLandRepository.getNetOnlineFatwa();
  }

  Future<Either<Failure, Map<String, List<MediaEntity>>>> callBooks() async {
    return await checkOfflineFiles(AppKeys.islamLandBooks)
        ? await islamLandRepository.getBooks()
        : await islamLandRepository.getOnlineBooks();
  }

  Future<Either<Failure, List<MediaEntity>>> callAudios() async {
    return await checkOfflineFiles(AppKeys.islamLandAudios)
        ? await islamLandRepository.getAudio()
        : await islamLandRepository.getOnlineAudio();
  }

  Future<Either<Failure, List<MediaEntity>>> callVideos() async {
    return await checkOfflineFiles(AppKeys.islamLandVideos)
        ? await islamLandRepository.getVideos()
        : await islamLandRepository.getOnlineVideos();
  }
}
