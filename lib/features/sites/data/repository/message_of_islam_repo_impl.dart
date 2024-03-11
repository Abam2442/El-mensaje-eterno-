import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/repository/fixed_repository.dart';
import '../data_source/message_of_islam_local_data_source.dart';

class MessageOfIslamRepositoryImp extends FixedRepository {
  final MessageOfIslamLocalDataSource messageOfIslamLocalDataSource;
  MessageOfIslamRepositoryImp({
    required this.messageOfIslamLocalDataSource,
  });
  @override
  Future<Either<Failure, List<FixedEntities>>> getArtical() async {
    await messageOfIslamLocalDataSource.getArtical();
    try {
      Get.find<Logger>()
          .i("Start `getArtical` in |MessageOfIslamRepositoryImp|");
      var artical = await messageOfIslamLocalDataSource.getArtical();
      Get.find<Logger>().w(
          "End `getArtical` in |MessageOfIslamRepositoryImp| ${artical.length}");
      return Right(artical);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getArtical` in |MessageOfIslamRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }
}
