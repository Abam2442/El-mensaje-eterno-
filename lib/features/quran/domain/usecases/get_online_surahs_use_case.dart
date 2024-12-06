import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/features/quran/domain/entities/surah_entity.dart';
import 'package:hiwayda_oracion_islamica/features/quran/domain/repository/quran_repo.dart';

class GetOnlineSurahsUseCase {
  final QuranRepo quranRepo;

  GetOnlineSurahsUseCase({required this.quranRepo});
  Future<Either<Failure, List<Surah>>> call() async {
    return await quranRepo.getData();
  }
}
