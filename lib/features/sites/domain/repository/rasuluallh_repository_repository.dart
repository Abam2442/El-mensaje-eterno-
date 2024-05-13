import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import '../../../../core/errors/failures.dart';
import '../entities/islam_religion_entities.dart';

abstract class RasuluallhRepository {
  Future<Either<Failure, List<IslamReligionEntities>>> getContent();
  Future<Either<Failure, List<MediaEntity>>> getAudios();
}
