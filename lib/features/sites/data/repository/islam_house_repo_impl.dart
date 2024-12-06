import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/data_source/local_data_source/islam_house_local_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/repository/islam_house_repository.dart';

class IslamHouseRepositoryImp extends IslamHouseRepository {
  final IslamHouseLocalDataSource islamHouseLocalDataSource;
  IslamHouseRepositoryImp({
    required this.islamHouseLocalDataSource,
  });

  @override
  Future<Either<Failure, List<FixedEntities>>> getContent() async {
    await islamHouseLocalDataSource.getContect();
    try {
      var content = await islamHouseLocalDataSource.getContect();

      return Right(content);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<FixedEntities>>> getFatwa() async {
    try {
      final fatwa = await islamHouseLocalDataSource.getFatwa();

      return Right(fatwa);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getBooks() async {
    try {
      var content = await islamHouseLocalDataSource.getBooks();

      return Right(content);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getVideos() async {
    try {
      var content = await islamHouseLocalDataSource.getVideos();

      return Right(content);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getAudios() async {
    try {
      var content = await islamHouseLocalDataSource.getAudios();

      return Right(content);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
