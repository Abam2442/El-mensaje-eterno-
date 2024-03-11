import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/islam_message_entities.dart';

abstract class IslamMessageRepository {
  Future<Either<Failure, List<IslamMessageArticalEntities>>> getArtical();
  Future<Either<Failure, List<IslamMessageBookEntities>>> getBook();
  Future<Either<Failure, List<IslamMessageAudioEntities>>> getAudio();
}
