import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/repository/islam_house_repository.dart';
import '../data_source/islam_house_local_data_source.dart';

class IslamHouseRepositoryImp extends IslamHouseRepository {
  final IslamHouseLocalDataSource islamHouseLocalDataSource;
  IslamHouseRepositoryImp({
    required this.islamHouseLocalDataSource,
  });

  @override
  Future<Either<Failure, List<List<FixedEntities>>>> getContent() async {
    await islamHouseLocalDataSource.getContect();
    try {
      Get.find<Logger>().i("Start `getContent` in |IslamHouseRepositoryImp|");
      var content = await islamHouseLocalDataSource.getContect();
      Get.find<Logger>()
          .w("End `getContent` in |IslamHouseRepositoryImp| ${content.length}");
      return Right(content);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getContent` in |IslamHouseRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MediaEntity>>> getBooks() async {
    try {
      Get.find<Logger>().i("Start `getBooks` in |IslamHouseRepositoryImp|");
      var content = await islamHouseLocalDataSource.getBooks();
      Get.find<Logger>()
          .w("End `getBooks` in |IslamHouseRepositoryImp| ${content.length}");
      return Right(content);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getBooks` in |IslamHouseRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }
}
