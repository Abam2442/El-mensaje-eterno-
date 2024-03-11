import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/repository/fixed_repository.dart';
import '../data_source/mohammad_messanger_local_data_source.dart';

class MohammadMessangerRepositoryImp extends FixedRepository {
  final MohammadMessangerLocalDataSource messangerLocalDataSource;
  MohammadMessangerRepositoryImp({
    required this.messangerLocalDataSource,
  });
  @override
  Future<Either<Failure, List<FixedEntities>>> getArtical() async {
    await messangerLocalDataSource.getArtical();
    try {
      Get.find<Logger>()
          .i("Start `getArtical` in |MohammadMessangerRepositoryImp|");
      var artical = await messangerLocalDataSource.getArtical();
      Get.find<Logger>().w(
          "End `getArtical` in |MohammadMessangerRepositoryImp| ${artical.length}");
      return Right(artical);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getArtical` in |MohammadMessangerRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }
}
