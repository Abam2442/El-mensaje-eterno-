import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/repository/fixed_repository.dart';
import '../data_source/women_local_data_source.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class WomanRepositoryImp extends FixedRepository {
  final WomenLocalDataSource womenLocalDataSource;
  WomanRepositoryImp({
    required this.womenLocalDataSource,
  });
  @override
  Future<Either<Failure, List<FixedEntities>>> getArtical() async {
    await womenLocalDataSource.getArtical();
    try {
      Get.find<Logger>().i("Start `getArtical` in |WomanRepositoryImp|");
      var artical = await womenLocalDataSource.getArtical();
      Get.find<Logger>()
          .w("End `getArtical` in |WomanRepositoryImp| ${artical.length}");
      return Right(artical);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getArtical` in |WomanRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }
}
