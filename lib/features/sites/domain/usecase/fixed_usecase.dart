import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../entities/fixed_entities.dart';
import '../repository/fixed_repository.dart';

class FixedUseCase {
  final FixedRepository fixedRepository;
  FixedUseCase(
    this.fixedRepository,
  );
  Future<Either<Failure, List<FixedEntities>>> call() async {
    Get.find<Logger>().i("Call FixedUseCase");
    return fixedRepository.getArtical();
  }
}
