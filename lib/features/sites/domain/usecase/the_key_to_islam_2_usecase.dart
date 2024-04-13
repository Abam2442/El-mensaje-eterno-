import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../data/models/the_key_to_islam_2_model.dart';
import '../repository/the_key_to_islam_2_repo.dart';

class TheKeyToIslam2UseCase {
  final TheKeyToIslam2Repo theKeyToIslam2Repo;
  TheKeyToIslam2UseCase(
    this.theKeyToIslam2Repo,
  );
  Future<Either<Failure, List<TheKeyToIslam2>>> call() async {
    Get.find<Logger>().i("Call TheKeyToIslam2UseCase");
    return theKeyToIslam2Repo.getArtical();
  }
}
