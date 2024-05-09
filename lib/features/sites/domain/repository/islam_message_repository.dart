import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import '../../../../core/errors/failures.dart';
import '../entities/islam_message_entities.dart';

abstract class IslamMessageRepository {
  Future<Either<Failure, List<IslamMessageArticalEntities>>> getArtical();
  Future<Either<Failure, List<MediaCategoryEntity>>> getBook();
  Future<Either<Failure, List<IslamMessageAudioEntities>>> getAudio();
}
