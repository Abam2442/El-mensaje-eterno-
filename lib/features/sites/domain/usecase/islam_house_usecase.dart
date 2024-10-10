import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import '../../../../core/errors/failures.dart';
import '../entities/fixed_entities.dart';
import '../repository/islam_house_repository.dart';

class IslamHouseUseCase {
  final IslamHouseRepository islamHouseRepository;
  IslamHouseUseCase(
    this.islamHouseRepository,
  );

  Future<Either<Failure, List<FixedEntities>>> call() async {
    return islamHouseRepository.getContent();
  }

  Future<Either<Failure, List<MediaEntity>>> getBooks() async {
    return islamHouseRepository.getBooks();
  }

  Future<Either<Failure, List<MediaEntity>>> getAudios() async {
    return islamHouseRepository.getAudios();
  }

  Future<Either<Failure, List<MediaEntity>>> getVideos() async {
    return islamHouseRepository.getVideos();
  }

  Future<Either<Failure, List<FixedEntities>>> getFatwa() async {
    return islamHouseRepository.getFatwa();
  }
}
