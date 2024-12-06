import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/check_offline_files.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import '../../../../core/errors/failures.dart';
import '../entities/islam_message_entities.dart';
import '../repository/islam_message_repository.dart';

class IslamMessageUseCase {
  final IslamMessageRepository islamMessageRepository;
  IslamMessageUseCase(
    this.islamMessageRepository,
  );
  Future<Either<Failure, List<IslamMessageArticalEntities>>>
      callArtical() async {
    return await checkOfflineFiles(AppKeys.islamMessage)
        ? await islamMessageRepository.getArtical()
        : await islamMessageRepository.getOnlineArticales();
  }

  Future<Either<Failure, List<MediaCategoryEntity>>> callBook() async {
    return await checkOfflineFiles(AppKeys.islamMessageBooks)
        ? await islamMessageRepository.getBook()
        : await islamMessageRepository.getOnlineBooks();
  }

  Future<Either<Failure, List<MediaEntity>>> callAudio() async {
    return await checkOfflineFiles(AppKeys.islamMessageAudios)
        ? await islamMessageRepository.getAudio()
        : await islamMessageRepository.getOnlineAudios();
  }

  Future<Either<Failure, List<MediaEntity>>> callVideos() async {
    return await checkOfflineFiles(AppKeys.islamMessageVideos)
        ? await islamMessageRepository.getVideos()
        : await islamMessageRepository.getOnlineVideos();
  }

  Future<Either<Failure, List<MediaEntity>>> callQuranVideos() async {
    return await checkOfflineFiles(AppKeys.islamMessageQuranVideos)
        ? await islamMessageRepository.getQuranVideos()
        : await islamMessageRepository.getOnlineQuranVideos();
  }
}
