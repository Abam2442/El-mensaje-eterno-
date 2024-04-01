import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../entities/fixed_entities.dart';
import '../repository/islam_faith_repository.dart';

class IslamFaithUseCase {
  final IslamFaithRepository islamFaithRepository;
  IslamFaithUseCase(
    this.islamFaithRepository,
  );
  Future<Either<Failure, List<FixedEntities>>> call() async {
    Get.find<Logger>().i("Call FixedUseCase");
    return islamFaithRepository.getArtical();
  }
}
