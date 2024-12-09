import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/check_offline_files.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/models/knowing_allah_model.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import '../../../../core/errors/failures.dart';
import '../repository/knowing_allah_repository.dart';

class KnowingAllahUseCase {
  final KnowingAllahRepository knowingAllahRepository;
  KnowingAllahUseCase(
    this.knowingAllahRepository,
  );
  Future<Either<Failure, List<KnowingAllahSubCategoryModel>>> call() async {
    return await checkOfflineFiles(AppKeys.knowingAllah)
        ? await knowingAllahRepository.getArtical()
        : await knowingAllahRepository.getOnlineArtical();
  }

  Future<Either<Failure, List<MediaEntity>>> getBooks() async {
    return await checkOfflineFiles(AppKeys.knowingAllahBooks)
        ? await knowingAllahRepository.getBooks()
        : await knowingAllahRepository.getOnlineBooks();
  }

  Future<Either<Failure, List<MediaEntity>>> getAudios() async {
    return await checkOfflineFiles(AppKeys.knowingAllahAudios)
        ? await knowingAllahRepository.getAudios()
        : await knowingAllahRepository.getOnlineAudios();
  }

  Future<Either<Failure, List<MediaCategoryEntity>>> getVideos() async {
    return await checkOfflineFiles(AppKeys.knowingAllahVideos)
        ? await knowingAllahRepository.getVideos()
        : await knowingAllahRepository.getOnlineVideos();
  }
}
