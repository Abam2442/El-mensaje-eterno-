import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/check_offline_files.dart';
import '../../../../core/errors/failures.dart';
import '../entities/islam_for_christians_entities.dart';
import '../repository/islam_for_christians_repository.dart';

class IslamForChristiansUseCase {
  final IslamForChristiansRepository islamForChristiansRepository;
  IslamForChristiansUseCase(
    this.islamForChristiansRepository,
  );

  Future<Either<Failure, List<IslamForChristiansEntities>>> call() async {
    return await checkOfflineFiles(AppKeys.islamForChristians)
        ? await islamForChristiansRepository.getContent()
        : await islamForChristiansRepository.getOnlineContent();
  }
}
