import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/check_offline_files.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/islam_qa.dart';
import '../repository/islam_qa_repository.dart';

class IslamQAUseCase {
  final IslamQARepository islamQARepository;
  IslamQAUseCase(
    this.islamQARepository,
  );

  Future<Either<Failure, List<Islamqa>>> call() async {
    return await checkOfflineFiles(AppKeys.islamQA)
        ? await islamQARepository.getArtical()
        : await islamQARepository.getOnlineArtical();
  }
}
