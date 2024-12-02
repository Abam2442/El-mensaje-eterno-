import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/zad_daeia_entity.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/repository/zad_daeia_repo.dart';

class GetZadsUsecase {
  final ZadDaeiaRepository zadDaeiaRepository;

  GetZadsUsecase(this.zadDaeiaRepository);

  Future<Either<Failure, List<ZadDaeiaEntity>>> call() async {
    return await zadDaeiaRepository.getZads();
  }
}
