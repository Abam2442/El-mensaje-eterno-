import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/domain/repository/hadith_repo.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/model/sunnah_data_model.dart';

class GetHadithencHadithesUseCase {
  final HadithRepo hadithRepo;

  GetHadithencHadithesUseCase(this.hadithRepo);

  Future<Either<Failure, List<SunnahDataModel>>> call(String path) async {
    return await hadithRepo.getSunnah(path);
  }
}
