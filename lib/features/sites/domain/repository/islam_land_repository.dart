import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import '../../../../core/errors/failures.dart';
import '../entities/islam_land_entities.dart';

abstract class IslamLandRepository {
  Future<Either<Failure, List<List<FixedEntities>>>> getContent();
  Future<Either<Failure, Map<String, List<MediaEntity>>>> getBooks();
  Future<Either<Failure, List<IslamLandFatwaEntities>>> getFatwa();
}
