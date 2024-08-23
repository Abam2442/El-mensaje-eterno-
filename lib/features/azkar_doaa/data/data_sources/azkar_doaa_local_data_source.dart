import 'dart:convert';

import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/services/archive_service.dart';
import 'package:hiwayda_oracion_islamica/core/services/shared_preferences_service.dart';

import '../models/azkar_model/azkar_model.dart';
import '../models/doaa_model/doaa_model.dart';
import '../models/sonan_model.dart';

abstract class AzkarDoaaLocalDataSource {
  Future<List<AzkarModel>> getAzkar();

  Future<List<DoaaModel>> getDoaas();
  Future<Sonan> getSonan();
}

class AzkarDoaaLocalDataSourceImpl extends AzkarDoaaLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  AzkarDoaaLocalDataSourceImpl({
    required this.sharedPreferencesService,
    required this.archiveService,
  });

  @override
  Future<List<AzkarModel>> getAzkar() async {
    try {
      String? fileContent =
          await archiveService.readFile(name: AppKeys.azkarDua);

      List<AzkarModel> azkar = [];
      if (fileContent != null) {
        var jsonData = json.decode(fileContent);
        azkar = jsonData['azkar']
            .map<AzkarModel>(
              (azkar) => AzkarModel.fromJson(azkar),
            )
            .toList();
      }

      return Future.value(azkar);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<DoaaModel>> getDoaas() async {
    try {
      String? fileContent = await archiveService.readFile(name: AppKeys.alduaa);

      late List<DoaaModel> doaas = [];
      if (fileContent != null) {
        var jsonData = json.decode(fileContent);
        jsonData['Es'].forEach((element) {
          // List<SingleDoaa> list = [];
          // element['الأدعية'].forEach((a) {
          //   list.add(SingleDoaa(arabic: a['عربي'], espanule: a['أسباني']));
          // });
          doaas.add(DoaaModel(
              link: element['الرابط'],
              title: element['العنوان'],
              noOfPages: element['عدد الصفحات'],
              listOfDoaa: List<String>.from(element["الأدعية"].map((x) => x))));
        });
      }

      return Future.value(doaas);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Sonan> getSonan() async {
    try {
      String? fileContent = await archiveService.readFile(name: AppKeys.sonan);

      // late Sonan sonan ;
      List<DayAndNightSonan> nightAndDaySonan = [];
      List<TimedSonan> timedSonan = [];
      List<NotTimedSonan> unTimedSonan = [];
      if (fileContent != null) {
        var jsonData = json.decode(fileContent);
        // print(jsonData['Es']['سنن موقوتة'][0]['الأذكار']);
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
      }
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
