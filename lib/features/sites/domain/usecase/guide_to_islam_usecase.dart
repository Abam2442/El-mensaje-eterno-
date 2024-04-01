import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../entities/fixed_entities.dart';
import '../repository/guide_to_islam_repository.dart';

class GuideToIslamUseCase {
  final GuideToIslamRepository islamRepository;
  GuideToIslamUseCase(
    this.islamRepository,
  );

  Future<Either<Failure, List<List<FixedEntities>>>> call() async {
    Get.find<Logger>().i("Call GuideToIslamUseCase");
    return islamRepository.getContent();
  }
}
