import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/check_offline_files.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/data/models/hadith_model.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/domain/repository/hadith_repo.dart';

class GetSunnahHadithesUseCase {
  final HadithRepo hadithRepo;

  GetSunnahHadithesUseCase(this.hadithRepo);

  Future<Either<Failure, List<SunnahHadithModel>>> call() async {
    // Get.find<Logger>().i("Call GetHadithesUseCase");
    return await checkOfflineFiles('Hadiths.json')
        ? await hadithRepo.getHadithes()
        : await hadithRepo.getOnlineHadithData();
  }
}
