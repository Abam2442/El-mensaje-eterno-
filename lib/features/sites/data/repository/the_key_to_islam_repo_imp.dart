import 'package:dartz/dartz.dart';
// import 'package:elresala/features/sites/data/data_source/the_key_to_islam_local_date_source.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/repository/the_key_to_islam_repo.dart';
import '../data_source/the_key_to_islam_local_date_source.dart';
import '../models/the_key_to_islam_model.dart';

class TheKeyToIslamRepositoryImp extends TheKeyToIslamRepo {
  final TheKeyToIslamLocalDataSource theKeyToIslamLocalDataSource;
  TheKeyToIslamRepositoryImp({
    required this.theKeyToIslamLocalDataSource,
  });
  @override
  Future<Either<Failure, List<TheKeyToIslamfirst>>> getArtical() async {
    await theKeyToIslamLocalDataSource.getArtical();
    try {
      Get.find<Logger>()
          .i("Start `getArtical` in |TheKeyToIslamRepositoryImp|");
      var artical = await theKeyToIslamLocalDataSource.getArtical();
      Get.find<Logger>().w(
          "End `getArtical` in |TheKeyToIslamRepositoryImp| ${artical.length}");
      return Right(artical);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getArtical` in |TheKeyToIslamRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }
}
