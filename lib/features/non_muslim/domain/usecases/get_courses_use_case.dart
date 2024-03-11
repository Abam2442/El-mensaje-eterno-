import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/features/non_muslim/data/models/course_model.dart';
import 'package:hiwayda_oracion_islamica/features/non_muslim/domain/repository/non_muslim_repo.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class GetCoursesUseCase {
  final NonMuslimRepo nonMuslimRepo;

  GetCoursesUseCase(this.nonMuslimRepo);

  Future<Either<Failure, List<NonMuslimModel>>> call() async {
    Get.find<Logger>().i("Call GetCoursesUseCase");
    return await nonMuslimRepo.getCourses();
  }
}
