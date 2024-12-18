import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/check_offline_files.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/repository/terminology_repo.dart';

class TerminologyUsecase {
  final FixedCategoryRepository _categoryRepository;

  TerminologyUsecase({required FixedCategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository;

  Future<Either<Failure, List<CategoryFixedEntity>>> call() async {
    return await checkOfflineFiles(AppKeys.terminology)
        ? await _categoryRepository.getCategoryArtical()
        : await _categoryRepository.getOnlineCategoryArtical();
  }
}
