import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/data/models/hadith_model.dart';

abstract class HadithRepo {
  Future<Either<Failure, SunnahHadithModel>> getSunnahHadithes();
  Future<Either<Failure, HaditencHadithModel>> getHadithencHadithes();
}
