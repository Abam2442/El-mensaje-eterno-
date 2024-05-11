import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../entities/islam_message_entities.dart';
import '../repository/islam_message_repository.dart';

class IslamMessageUseCase {
  final IslamMessageRepository islamMessageRepository;
  IslamMessageUseCase(
    this.islamMessageRepository,
  );
  Future<Either<Failure, List<IslamMessageArticalEntities>>>
      callArtical() async {
    Get.find<Logger>().i("Call LearningIslamUseCase");
    return await islamMessageRepository.getArtical();
  }

  Future<Either<Failure, List<MediaCategoryEntity>>> callBook() async {
    Get.find<Logger>().i("Call LearningIslamUseCase");
    return await islamMessageRepository.getBook();
  }

  Future<Either<Failure, List<IslamMessageAudioEntities>>> callAudio() async {
    Get.find<Logger>().i("Call LearningIslamUseCase");
    return await islamMessageRepository.getAudio();
  }
}
