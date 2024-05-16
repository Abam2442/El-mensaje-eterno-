import 'dart:convert';

import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/services/archive_service.dart';
import 'package:hiwayda_oracion_islamica/core/services/shared_preferences_service.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

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
      Get.find<Logger>().i("Start `getAzkars` in |AzkarLocalDataSourceImpl|");
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
      Get.find<Logger>().w("End `getAzkars` in |AzkarLocalDataSourceImpl|");
      return Future.value(azkar);
    } catch (e) {
      Get.find<Logger>().e(
        "End `getAzkars` in |AzkarLocalDataSourceImpl| Exception: ${e.runtimeType}",
      );
      rethrow;
    }
  }

  @override
  Future<List<DoaaModel>> getDoaas() async {
    try {
      Get.find<Logger>().i("Start `getDoaas` in |DoaaLocalDataSourceImpl|");
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
      Get.find<Logger>().w("End `getDoaas` in |DoaaLocalDataSourceImpl|");
      return Future.value(doaas);
    } catch (e) {
      Get.find<Logger>().e(
        "End `getDoaas` in |DoaaLocalDataSourceImpl| Exception: ${e.runtimeType}",
      );
      rethrow;
    }
  }

  @override
  Future<Sonan> getSonan() async {
    try {
      Get.find<Logger>().i("Start `getSonan` in |SonanLocalDataSourceImpl|");
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
      Get.find<Logger>().w("End `getSonan` in |SonanLocalDataSourceImpl|");
      return Future.value(sonan);
    } catch (e) {
      Get.find<Logger>().e(
        "End `getSonan` in |SonanLocalDataSourceImpl| Exception: ${e.runtimeType}",
      );
      rethrow;
    }
  }
}
