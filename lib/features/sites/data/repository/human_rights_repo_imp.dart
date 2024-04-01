import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/repository/human_rights_repository.dart';
import '../data_source/human_rights_local_data_source.dart';
// import '../data_source/HumanRights_local_data_source.dart';

class HumanRightsRepositoryImp extends HumanRightsRepository {
  final HumanRightsLocalDataSource humanRightsLocalDataSource;
  HumanRightsRepositoryImp({
    required this.humanRightsLocalDataSource,
  });
  @override
  Future<Either<Failure, List<FixedEntities>>> getArtical() async {
    await humanRightsLocalDataSource.getArtical();
    try {
      Get.find<Logger>().i("Start `getArtical` in |HumanRightsRepositoryImp|");
      var artical = await humanRightsLocalDataSource.getArtical();
      Get.find<Logger>().w(
          "End `getArtical` in |HumanRightsRepositoryImp| ${artical.length}");
      return Right(artical);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getArtical` in |HumanRightsRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }
}
