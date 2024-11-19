import 'package:dartz/dartz.dart';
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
    return knowingAllahRepository.getArtical();
  }

  Future<Either<Failure, List<MediaEntity>>> getBooks() async {
    return knowingAllahRepository.getBooks();
  }

  Future<Either<Failure, List<MediaEntity>>> getAudios() async {
    return knowingAllahRepository.getAudios();
  }

  Future<Either<Failure, List<MediaCategoryEntity>>> getVideos() async {
    return knowingAllahRepository.getVideos();
  }
}
