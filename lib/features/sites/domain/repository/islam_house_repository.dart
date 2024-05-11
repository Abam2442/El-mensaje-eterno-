import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import '../../../../core/errors/failures.dart';
import '../entities/fixed_entities.dart';

abstract class IslamHouseRepository {
  Future<Either<Failure, List<List<FixedEntities>>>> getContent();
  Future<Either<Failure, List<MediaEntity>>> getBooks();
}
