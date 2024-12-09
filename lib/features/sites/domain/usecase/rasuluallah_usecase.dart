import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/check_offline_files.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/repository/rasuluallh_repository_repository.dart';
import '../../../../core/errors/failures.dart';

class RasuluallahUseCase {
  final RasuluallhRepository repository;
  RasuluallahUseCase(
    this.repository,
  );

  Future<Either<Failure, List<CategoryFixedEntity>>> call() async {
    return await checkOfflineFiles(AppKeys.rasuluAllah)
        ? await repository.getContent()
        : await repository.getOnlineContent();
  }

  Future<Either<Failure, List<MediaEntity>>> getAudios() async {
    return await checkOfflineFiles(AppKeys.rasuluAllahAudios)
        ? await repository.getAudios()
        : await repository.getOnlineAudios();
  }

  Future<Either<Failure, List<MediaCategoryEntity>>> getVideos() async {
    return await checkOfflineFiles(AppKeys.rasuluAllahVideos)
        ? await repository.getVideos()
        : await repository.getOnlineVideos();
  }
}
