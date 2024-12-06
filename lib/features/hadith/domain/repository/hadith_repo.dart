import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/data/models/hadith_model.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/model/sunnah_data_model.dart';

abstract class HadithRepo {
  Future<Either<Failure, List<SunnahHadithModel>>> getHadithes();
  Future<Either<Failure, List<SunnahDataModel>>> getSunnah(String path);
  Future<Either<Failure, List<SunnahHadithModel>>> getOnlineHadithData();
  Future<Either<Failure, List<SunnahDataModel>>> getOnlineSunnahData(
      String path);
}
