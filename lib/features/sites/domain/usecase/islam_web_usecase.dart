import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/check_offline_files.dart';
import '../../../../core/errors/failures.dart';
import '../entities/islam_web_entities.dart';
import '../repository/islam_web_repository.dart';

class IslamWebUseCase {
  final IslamWebRepository islamWebRepository;
  IslamWebUseCase(
    this.islamWebRepository,
  );
  Future<Either<Failure, List<IslamWebEntities>>> call() async {
    return await checkOfflineFiles(AppKeys.islamWeb)
        ? await islamWebRepository.getArtical()
        : await islamWebRepository.getOnlineArtical();
  }
}
