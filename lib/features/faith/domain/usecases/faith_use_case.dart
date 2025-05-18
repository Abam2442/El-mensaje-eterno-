import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/features/faith/data/model/faithModel.dart';
import 'package:hiwayda_oracion_islamica/features/faith/data/repository/faith_repo_impl.dart';

class FaithUseCase {
  final FaithRepoImpl _faithRepo;

  FaithUseCase(this._faithRepo);

  Future<Either<Failure, FaithModel>> call() async {
    return _faithRepo.getOfflineData();
  }
}
