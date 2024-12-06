import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/check_offline_files.dart';
import 'package:hiwayda_oracion_islamica/features/faith/data/model/faithModel.dart';
import 'package:hiwayda_oracion_islamica/features/faith/domain/repository/faith_repo.dart';

class FaithUseCase {
  final FaithRepo _faithRepo;

  FaithUseCase(this._faithRepo);

  Future<Either<Failure, FaithModel>> call() async {
    return await checkOfflineFiles('Sp-faith.json')
        ? await _faithRepo.getOfflineData()
        : await _faithRepo.getOnlineData();
  }
}
