import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/repository/rasuluallh_repository_repository.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';

import '../data_source/rasuluallah_local_data_source.dart';

class RasuluallhRepositoryImp extends RasuluallhRepository {
  final RasuluallhLocalDataSource rasuluallhLocalDataSource;
  RasuluallhRepositoryImp({
    required this.rasuluallhLocalDataSource,
  });
  @override
  Future<Either<Failure, List<CategoryFixedEntity>>> getContent() async {
    await rasuluallhLocalDataSource.getContent();
    try {
      var artical = await rasuluallhLocalDataSource.getContent();

      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getAudios() async {
    try {
      var artical = await rasuluallhLocalDataSource.getAudios();

      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaCategoryEntity>>> getVideos() async {
    try {
      var artical = await rasuluallhLocalDataSource.getVideos();

      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
