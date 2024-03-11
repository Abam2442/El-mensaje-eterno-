import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../entities/islam_for_christians_entities.dart';
import '../repository/islam_for_christians_repository.dart';

class IslamForChristiansUseCase {
  final IslamForChristiansRepository islamForChristiansRepository;
  IslamForChristiansUseCase(
    this.islamForChristiansRepository,
  );

  Future<Either<Failure, List<IslamForChristiansEntities>>> call() async {
    Get.find<Logger>().i("Call IslamForChristiansUseCase");
    return islamForChristiansRepository.getContent();
  }
}
