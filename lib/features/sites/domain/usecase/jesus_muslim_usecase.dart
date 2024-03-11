import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../entities/jesus_muslim_entities.dart';
import '../repository/jesus_muslim_repository.dart';

class JesusMuslimUseCase {
  final JesusMuslimRepository jesusMuslimRepository;
  JesusMuslimUseCase(
    this.jesusMuslimRepository,
  );
  Future<Either<Failure, List<JesusMuslimEntities>>> call() async {
    Get.find<Logger>().i("Call FixedUseCase");
    return jesusMuslimRepository.getArtical();
  }
}
