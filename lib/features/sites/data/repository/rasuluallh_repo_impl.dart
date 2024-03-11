import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/islam_religion_entities.dart';
import '../../domain/repository/islam_religion_repository.dart';
import '../data_source/rasuluallah_local_data_source.dart';

class RasuluallhRepositoryImp extends IslamReligionRepository {
  final RasuluallhLocalDataSource rasuluallhLocalDataSource;
  RasuluallhRepositoryImp({
    required this.rasuluallhLocalDataSource,
  });
  @override
  Future<Either<Failure, List<IslamReligionEntities>>> getContent() async {
    await rasuluallhLocalDataSource.getContent();
    try {
      Get.find<Logger>().i("Start `getContent` in |RasuluallhRepositoryImp|");
      var artical = await rasuluallhLocalDataSource.getContent();
      Get.find<Logger>()
          .w("End `getContent` in |RasuluallhRepositoryImp| ${artical.length}");
      return Right(artical);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getContent` in |RasuluallhRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }
}
