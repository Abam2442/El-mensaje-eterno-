import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../entities/fixed_entities.dart';
import '../repository/hisnul_mumin_repository.dart';

class HisnulMuminUseCase {
  final HisnulMuminRepository hisnulMuminRepository;
  HisnulMuminUseCase(
    this.hisnulMuminRepository,
  );
  Future<Either<Failure, List<FixedEntities>>> call() async {
    Get.find<Logger>().i("Call HisnulMuminUseCase");
    return hisnulMuminRepository.getArtical();
  }
}
