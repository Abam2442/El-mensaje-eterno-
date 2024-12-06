import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/features/quran/domain/entities/surah_entity.dart';

abstract class QuranRepo {
  Future<Either<Failure, List<Surah>>> getSurahs();
  Future<Either<Failure, List<Surah>>> getData();
}
