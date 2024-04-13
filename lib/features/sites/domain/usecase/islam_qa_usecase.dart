import 'package:dartz/dartz.dart';
// import 'package:elresala/features/sites/data/models/islam_qa.dart';
// import 'package:elresala/features/sites/domain/repository/islam_qa_repository.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../data/models/islam_qa.dart';
import '../repository/islam_qa_repository.dart';

class IslamQAUseCase {
  final IslamQARepository islamQARepository;
  IslamQAUseCase(
    this.islamQARepository,
  );

  Future<Either<Failure, List<Islamqa>>> call() async {
    Get.find<Logger>().i("Call IslamQAUseCase");
    return islamQARepository.getArtical();
  }
}
