import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../entities/islam_web_entities.dart';
import '../repository/islam_web_repository.dart';

class IslamWebUseCase {
  final IslamWebRepository islamWebRepository;
  IslamWebUseCase(
    this.islamWebRepository,
  );
  Future<Either<Failure, List<IslamWebEntities>>> call() async {
    Get.find<Logger>().i("Call IslamWebUseCase");
    return islamWebRepository.getArtical();
  }
}
