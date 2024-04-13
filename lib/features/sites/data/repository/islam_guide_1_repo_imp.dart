import 'package:dartz/dartz.dart';
// import 'package:elresala/features/sites/data/data_source/islam_qa_local_datasorce.dart';
// import 'package:elresala/features/sites/data/models/islam_qa.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/repository/islam_guide_1_repository.dart';
// import '../data_source/islam_qa_local_datasorce.dart';
import '../data_source/islam_guide_1_local_data_source.dart';
import '../models/islam_guide_1_model.dart';

class IslamGuide1RepositoryImp extends IslamGuide1Repository {
  final IslamGuide1LocalDataSource islamGuide1LocalDataSource;
  IslamGuide1RepositoryImp({
    required this.islamGuide1LocalDataSource,
  });
  @override
  Future<Either<Failure, List<IslamGuide1>>> getArtical() async {
    await islamGuide1LocalDataSource.getArtical();
    try {
      Get.find<Logger>().i("Start `getArtical` in |IslamGuide1RepositoryImp|");
      var artical = await islamGuide1LocalDataSource.getArtical();
      Get.find<Logger>().w(
          "End `getArtical` in |IslamGuide1RepositoryImp| ${artical.length}");
      return Right(artical);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getArtical` in |IslamGuide1RepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }
}
