import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../data/models/saber_el_islam_model.dart';
import '../repository/saber_el_islam_repository.dart';

class SaberElIslamUseCase {
  final SaberElIslamRepository saberElIslamRepository;
  SaberElIslamUseCase(
    this.saberElIslamRepository,
  );
  Future<Either<Failure, List<SaberElIslamModel>>> call() async {
    Get.find<Logger>().i("Call SaberElIslamUseCase");
    return await saberElIslamRepository.getArtical();
  }
}
