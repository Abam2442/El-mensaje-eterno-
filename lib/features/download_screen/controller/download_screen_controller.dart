import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/features/download_screen/download_status.dart';
import 'package:http/http.dart' as http;
import 'package:hiwayda_oracion_islamica/core/helper/functions/check_offline_files.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_api_routes.dart';
import 'package:hiwayda_oracion_islamica/features/download_screen/model/sections_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DownloadScreenController extends GetxController {
  // late StateType stateType;
  int totalFiles = 0;
  int downloadedFiles = 0;
  late DownloadStatus downloadStatus;
  Map<String, bool> sectionTwoFiles = {
    'ALFAJR-intermediate.json': false,
    'asr.json': false,
    'duhr.json': false,
    'Duhr-asr-ishaa-intermediate.json': false,
    'fajr.json': false,
    'isha.json': false,
    'islamicCenters.json': false,
    'Maghreb-intermediate.json': false,
    'Maghrib.json': false,
    'Sp-biographyofprophet.json': false,
    'Sp-faith.json': false,
    'Sp-moomlat.json': false,
    'Sp-newlife.json': false,
    'sp-newmuslim-category.json': false,
    'Sp-newmuslimscourse.json': false,
    'Sp-pillers.json': false
  };
  Map<String, bool> sectionThreeFiles = {
    'Hadiths.json': false,
    'Muslim.json': false,
    'Bokhary.json': false,
    'alnawawi.json': false,
    'ryadelsalheen.json': false
  };
  Map<String, bool> sectionFourFiles = {
    AppKeys.nonMuslims: false,
    AppKeys.islamLand: false,
    AppKeys.islamReligion: false,
    AppKeys.islamMessage: false,
    AppKeys.knowingAllah: false,
    AppKeys.rasuluAllah: false,
    AppKeys.muhammadTheMessengerOfGod: false,
    AppKeys.jesusQuran: false,
    AppKeys.islamForChristians: false,
    AppKeys.guideToIslam: false,
    AppKeys.islamFaith: false,
    AppKeys.theKeyToIslam1: false,
    AppKeys.theKeyToIslam2: false,
    AppKeys.messageOfIslam: false,
    AppKeys.islamPort: false,
    AppKeys.islamReligionOfPeace: false,
    AppKeys.islamUniverse: false,
    AppKeys.humanRights: false,
    AppKeys.womanInIslam: false,
    AppKeys.romanceInIslam: false,
    AppKeys.loveInIslam: false,
    AppKeys.bidaaInIslam: false,
    AppKeys.beginningAndEnd: false,
    AppKeys.hisnulmumin: false,
    AppKeys.firstSteps: false,
    AppKeys.telegram: false,
    'data-1.json': false,
  };

  Future<void> downloadFiles(int index) async {
    switch (index) {
      case 0:
        {
          await downloadSectionOne();
        }
        break;
      case 1:
        {
          await downloadSectionTwo();
          await downloadSectionTwoVideos();
        }
        break;
      case 2:
        {
          await downloadSectionThree();
        }
        break;
      case 3:
        {
          await downloadSectionFour();
        }
    }
  }

  Future<void> downloadSectionOne() async {
    try {
      downloadStatus = DownloadStatus.downloading;
      totalFiles = 1;
      downloadedFiles = 0;

      update();
      final response = await http.get(
        Uri.parse('${AppApiRoutes.jsonApi}quran.json'),
      );
      if (response.statusCode == 200) {
        final directory = await getApplicationDocumentsDirectory();
        final file = File('${directory.path}/quran.json');
        await file.writeAsBytes(response.bodyBytes);
        downloadedFiles++;
        downloadStatus = DownloadStatus.success;

        checkAllFiles();
        update();
      } else {
        update();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> downloadSectionTwo() async {
    try {
      downloadStatus = DownloadStatus.downloading;
      downloadedFiles = 0;

      totalFiles = 81;
      update();

      List<String> keys = sectionTwoFiles.keys.toList();

      for (int i = 0; i < keys.length; i++) {
        final response = await http.get(
          Uri.parse('${AppApiRoutes.jsonApi}${keys[i]}'),
        );
        if (response.statusCode == 200) {
          final directory = await getApplicationDocumentsDirectory();
          final file = File('${directory.path}/${keys[i]}');
          await file.writeAsBytes(response.bodyBytes);

          downloadedFiles++;
          update();
        } else {
          print('Failed to download file');
        }
      }

      downloadStatus = DownloadStatus.success;
      update();
      // update();
    } catch (e) {
      print(e);
    }
  }

  Future<void> downloadSectionTwoVideos() async {
    downloadStatus = DownloadStatus.downloading;
    update();
    final List<String> filePaths = [];
    final items = await Supabase.instance.client.storage.from('Videos').list();

    for (var item in items) {
      final String path = item.name;
      filePaths.add(path);
    }

    update();
    for (final filePath in filePaths) {
      final Uint8List fileBytes = await Supabase.instance.client.storage
          .from('Videos')
          .download(filePath);
      final directory = await getApplicationDocumentsDirectory();

      final videosDirectory = Directory('${directory.path}/Videos');
      await videosDirectory.create(recursive: true);

      final path = '${directory.path}/Videos/$filePath';
      downloadedFiles++;
      update();
      final file = File(path);
      await file.writeAsBytes(fileBytes);
    }
    checkAllFiles();
    downloadStatus = DownloadStatus.success;
    update();
  }

  Future<void> downloadSectionThree() async {
    try {
      downloadedFiles = 0;
      totalFiles = 5;
      downloadStatus = DownloadStatus.downloading;
      update();
      for (var item in sectionThreeFiles.keys) {
        final storage =
            await Supabase.instance.client.storage.from('Json').download(item);
        final directory = await getApplicationDocumentsDirectory();
        final file = File('${directory.path}/$item');
        file.writeAsBytesSync(storage);
        downloadedFiles++;
        update();
      }
      checkAllFiles();
      downloadStatus = DownloadStatus.success;

      update();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> downloadSectionFour() async {
    try {
      totalFiles = sectionFourFiles.length;
      downloadStatus = DownloadStatus.downloading;
      downloadedFiles = 0;
      update();
      for (var item in sectionFourFiles.keys) {
        final storage =
            await Supabase.instance.client.storage.from('Json').download(item);
        final directory = await getApplicationDocumentsDirectory();
        final file = File('${directory.path}/$item');
        file.writeAsBytesSync(storage);
        downloadedFiles++;
        update();
      }
      checkAllFiles();
      downloadStatus = DownloadStatus.success;

      update();
    } catch (e) {
      log(e.toString());
    }
  }

  List<SectionsModel> sectionData = [
    SectionsModel(
        title: 'Quran Section',
        subTitle: 'Make the Suar Offline Audio Still Online',
        isDownload: false),
    SectionsModel(
        title: 'Section Two',
        subTitle: 'Videos And all Texts',
        isDownload: false),
    SectionsModel(
      title: 'Hadith Section',
      subTitle: 'All Hadith',
      isDownload: false,
    ),
    SectionsModel(
      title: 'Section Four',
      subTitle: 'All Texts',
      isDownload: false,
    ),
  ];

  Future<void> checkAllFiles() async {
    try {
      downloadStatus = DownloadStatus.checking;
      update();

      /// Section one File check
      await checkOfflineFiles('quran.json')
          ? sectionData[0].isDownload = true
          : sectionData[0].isDownload = false;

      ///Section Three Check Files
      for (var item in sectionThreeFiles.keys) {
        await checkOfflineFiles(item)
            ? sectionThreeFiles[item] = true
            : sectionThreeFiles[item] = false;
      }
      if (sectionThreeFiles.values.every((value) => value)) {
        sectionData[2].isDownload = true;
      }

      ///Section Four Files check
      for (var item in sectionFourFiles.keys) {
        await checkOfflineFiles(item)
            ? sectionFourFiles[item] = true
            : sectionFourFiles[item] = false;
      }
      if (sectionFourFiles.values.every((value) => value)) {
        sectionData[3].isDownload = true;
      }

      ///Section Two Files check
      List<String> keys = sectionTwoFiles.keys.toList();

      for (int i = 0; i < keys.length; i++) {
        await checkOfflineFiles(keys[i])
            ? sectionTwoFiles[keys[i]] = true
            : sectionTwoFiles[keys[i]] = false;
      }

      final directory = await getApplicationDocumentsDirectory();
      final videosDirectory = Directory('${directory.path}/Videos');
      if (sectionTwoFiles.values.every((value) => value == true) == true) {
        if (videosDirectory.existsSync()) {
          sectionData[1].isDownload = true;
        } else {
          print('Videos Not Downloaded');
        }
      } else {
        print('Json Not Downloaded');
      }

      downloadStatus = DownloadStatus.init;
      update();
    } catch (e) {
      print({e});
    }
  }

  @override
  void onInit() async {
    await checkAllFiles();
    downloadStatus = DownloadStatus.init;
    update();
    // final directory = await getApplicationDocumentsDirectory();
    // final videosDirectory = Directory('${directory.path}/Videos');
    // print(videosDirectory.existsSync());

    super.onInit();
  }
}
