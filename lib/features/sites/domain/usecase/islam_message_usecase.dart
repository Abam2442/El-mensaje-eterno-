import 'package:dartz/dartz.dart';
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
    return await islamMessageRepository.getArtical();
  }

  Future<Either<Failure, List<MediaCategoryEntity>>> callBook() async {
    return await islamMessageRepository.getBook();
  }

  Future<Either<Failure, List<MediaEntity>>> callAudio() async {
    return await islamMessageRepository.getAudio();
  }

  Future<Either<Failure, List<MediaEntity>>> callVideos() async {
    return await islamMessageRepository.getVideos();
  }

  Future<Either<Failure, List<MediaEntity>>> callQuranVideos() async {
    return await islamMessageRepository.getQuranVideos();
  }
}
