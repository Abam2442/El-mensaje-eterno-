import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/data/models/hadith_model.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/domain/repository/hadith_repo.dart';

class GetHadithencHadithesUseCase {
  final HadithRepo hadithRepo;

  GetHadithencHadithesUseCase(this.hadithRepo);

  Future<Either<Failure, HaditencHadithModel>> call() async {
    
    return await hadithRepo.getHadithencHadithes();
  }
}
