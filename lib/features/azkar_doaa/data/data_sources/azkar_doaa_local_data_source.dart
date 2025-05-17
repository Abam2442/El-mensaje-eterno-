import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_assets_data.dart';
import '../models/azkar_model/azkar_model.dart';
import '../models/doaa_model/doaa_model.dart';
import '../models/sonan_model.dart';

abstract class AzkarDoaaLocalDataSource {
  Future<List<AzkarModel>> getAzkar();

  Future<List<DoaaModel>> getDoaas();
  Future<Sonan> getSonan();
}

class AzkarDoaaLocalDataSourceImpl extends AzkarDoaaLocalDataSource {
  @override
  Future<List<AzkarModel>> getAzkar() async {
    try {
      List<AzkarModel> azkar = [];
      final jsonData = await getAssetsData(AppKeys.azkarDua);

      azkar = jsonData['azkar']
          .map<AzkarModel>(
            (azkar) => AzkarModel.fromJson(azkar),
          )
          .toList();

      return Future.value(azkar);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<DoaaModel>> getDoaas() async {
    try {
      late List<DoaaModel> doaas = [];
      final jsonData = await getAssetsData(AppKeys.alduaa);

      jsonData['Es'].forEach((element) {
        doaas.add(DoaaModel(
            link: element['الرابط'],
            title: element['العنوان'],
            noOfPages: element['عدد الصفحات'],
            listOfDoaa: List<String>.from(element["الأدعية"].map((x) => x))));
      });

      return Future.value(doaas);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Sonan> getSonan() async {
    try {
      List<DayAndNightSonan> nightAndDaySonan = [];
      List<TimedSonan> timedSonan = [];
      List<NotTimedSonan> unTimedSonan = [];
      final jsonData = await getAssetsData(AppKeys.sonan);
      jsonData['Es']['أذكار اليوم والليلة'].forEach((element) {
        List<DayAndNightSonanSubCat> dayAndNightSonanSubCat = [];
        element['الأذكار'].forEach((a) {
          dayAndNightSonanSubCat.add(DayAndNightSonanSubCat(
              zikr: a['الذكر'] ?? '', noOfTimes: a['عدد المرات'] ?? ''));
        });
        nightAndDaySonan.add(DayAndNightSonan(
            azkar: dayAndNightSonanSubCat,
            desc: element['الوصف'] ?? '',
            link: element['الرابط'] ?? '',
            title: element['العنوان'] ?? ''));
      });
      jsonData['Es']['سنن موقوتة'].forEach((element) {
        List<TimedAndUntimedSub> dayAndNightSonanSubCat = [];
        element['الأذكار'].forEach((a) {
          dayAndNightSonanSubCat.add(TimedAndUntimedSub(
              zikr: a['الذكر'] ?? '', title: a['العنوان'] ?? ''));
        });
        timedSonan.add(TimedSonan(
            azkar: dayAndNightSonanSubCat,
            // desc: element['الوصف'],/
            link: element['الرابط'] ?? '',
            title: element['العنوان'] ?? ''));
      });
      jsonData['Es']['سنن غير موقوتة'].forEach((element) {
        List<TimedAndUntimedSub> dayAndNightSonanSubCat = [];
        element['الأذكار'].forEach((a) {
          dayAndNightSonanSubCat.add(TimedAndUntimedSub(
              zikr: a['الذكر'] ?? '', title: a['العنوان'] ?? ''));
        });
        unTimedSonan.add(NotTimedSonan(
            azkar: dayAndNightSonanSubCat,
            // desc: element['الوصف'],
            link: element['الرابط'] ?? '',
            title: element['العنوان'] ?? ''));
      });

      var sonan = Sonan(
          dayAndNightSonan: nightAndDaySonan,
          notTimedSonan: unTimedSonan,
          timedSonan: timedSonan);

      return Future.value(sonan);
    } catch (e) {
      rethrow;
    }
  }
}
