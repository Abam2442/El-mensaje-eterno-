import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/models/knowing_allah_model.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
// import 'package:elresala/features/sites/data/data_source/islam_qa_local_datasorce.dart';
// import 'package:elresala/features/sites/data/models/islam_qa.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/repository/knowing_allah_repository.dart';
import '../data_source/knowing_allah_local_data_source.dart';

class KnowingAllahRepositoryImp extends KnowingAllahRepository {
  final KnowingAllahLocalDataSource knowingAllahLocalDataSource;
  KnowingAllahRepositoryImp({
    required this.knowingAllahLocalDataSource,
  });
  @override
  Future<Either<Failure, KnowingAllahModel>> getArtical() async {
    await knowingAllahLocalDataSource.getContent();
    try {
      Get.find<Logger>().i("Start `getArtical` in |KnowingAllahRepositoryImp|");
      var artical = await knowingAllahLocalDataSource.getContent();
      Get.find<Logger>().w(
          "End `getArtical` in |KnowingAllahRepositoryImp| ${artical.articles.length}");
      return Right(artical);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getArtical` in |KnowingAllahRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getBooks() async {
    try {
      Get.find<Logger>().i("Start `getArtical` in |KnowingAllahRepositoryImp|");
      var artical = await knowingAllahLocalDataSource.getBooks();
      Get.find<Logger>().w(
          "End `getArtical` in |KnowingAllahRepositoryImp| ${artical.length}");
      return Right(artical);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getArtical` in |KnowingAllahRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getAudios() async {
    try {
      Get.find<Logger>().i("Start `getArtical` in |KnowingAllahRepositoryImp|");
      var artical = await knowingAllahLocalDataSource.getAudios();
      Get.find<Logger>().w(
          "End `getArtical` in |KnowingAllahRepositoryImp| ${artical.length}");
      return Right(artical);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getArtical` in |KnowingAllahRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }
}
