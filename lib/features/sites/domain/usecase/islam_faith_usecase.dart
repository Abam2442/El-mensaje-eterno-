import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/repository/islam_faith_repo_imp.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../entities/fixed_entities.dart';
import '../repository/fixed_repository.dart';
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
