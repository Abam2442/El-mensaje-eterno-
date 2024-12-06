import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/repository/sites_repository.dart';

class SitesUsecase {
  final SitesRepository _sitesRepository;

  SitesUsecase({required SitesRepository sitesRepository})
      : _sitesRepository = sitesRepository;

  Future<Either<Failure, List<FixedEntities>>> call(
      fileName, sectionName) async {
    return await _sitesRepository.getOnlineData(fileName, sectionName);
  }
}
