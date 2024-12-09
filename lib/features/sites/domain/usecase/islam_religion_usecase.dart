import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/check_offline_files.dart';
import '../../../../core/errors/failures.dart';

import '../entities/islam_religion_entities.dart';
import '../repository/islam_religion_repository.dart';

class IslamReligionUseCase {
  final IslamReligionRepository islamReligionRepository;
  IslamReligionUseCase(
    this.islamReligionRepository,
  );

  Future<Either<Failure, List<IslamReligionEntities>>> call() async {
    return await checkOfflineFiles(AppKeys.islamReligion)
        ? await islamReligionRepository.getContent()
        : await islamReligionRepository.getOnlineContent();
  }
}
