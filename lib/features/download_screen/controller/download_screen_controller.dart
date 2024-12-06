import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:http/http.dart' as http;
import 'package:hiwayda_oracion_islamica/core/helper/functions/check_offline_files.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_api_routes.dart';
import 'package:hiwayda_oracion_islamica/features/download_screen/model/sections_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DownloadScreenController extends GetxController {
  late StateType stateType;
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
    }
  }

  Future<void> downloadSectionOne() async {
    try {
      stateType = StateType.loading;
      update();
      final response = await http.get(
        Uri.parse('${AppApiRoutes.jsonApi}quran.json'),
      );
      if (response.statusCode == 200) {
        final directory = await getApplicationDocumentsDirectory();
        final file = File('${directory.path}/quran.json');
        await file.writeAsBytes(response.bodyBytes);
        checkAllFiles();

        stateType = StateType.success;
        update();
        print('File downloaded to ${file.path}');
      } else {
        stateType = StateType.offline;

        update();
        print('Failed to download file');
      }
    } catch (e) {
      print(e);
    }
  }

  int totalFiles = 81;
  int downloadedFiles = 0;
  Future<void> downloadSectionTwo() async {
    log('${sectionTwoFiles.keys.toList()}');
    try {
      stateType = StateType.loading;
      update();

      List<String> keys = sectionTwoFiles.keys.toList();
      // int totalFiles = keys.length;
      // int downloadedFiles = 0;
      // double progress = 0;

      for (int i = 0; i < keys.length; i++) {
        final response = await http.get(
          Uri.parse('${AppApiRoutes.jsonApi}${keys[i]}'),
        );
        if (response.statusCode == 200) {
          final directory = await getApplicationDocumentsDirectory();
          final file = File('${directory.path}/${keys[i]}');
          await file.writeAsBytes(response.bodyBytes);
          // print('File downloaded to ${file.path}');

          downloadedFiles++;
          // progress = downloadedFiles / totalFiles * 100;
          // print(progress);
          print(downloadedFiles);
          update(); // Update the UI with the new progress
        } else {
          print('Failed to download file');
        }
      }

      stateType = StateType.success;
      update();
      // update();
    } catch (e) {
      print(e);
    }
  }

  Future<void> downloadSectionTwoVideos() async {
    final List<String> filePaths = [];
    final items = await Supabase.instance.client.storage.from('Videos').list();

    for (var item in items) {
      final String path = item.name;
      filePaths.add(path);
    }

    // totalFiles = filePaths.length;
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
    update();
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
        title: 'Hadith Section', subTitle: 'All Hadith', isDownload: false),
  ];

  Future<void> checkAllFiles() async {
    try {
      stateType = StateType.loading;
      update();

      /// Section one File check
      await checkOfflineFiles('quran.json')
          ? sectionData[0].isDownload = true
          : sectionData[0].isDownload = false;

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

      // sectionTwoFiles.values.every((value) => value == true) == true
      //     ? sectionData[1].isDownload = true
      //     : print('File Not Found');

      stateType = StateType.success;
      update();
    } catch (e) {
      print({e});
    }
  }

  @override
  void onInit() async {
    final directory = await getApplicationDocumentsDirectory();
    final videosDirectory = Directory('${directory.path}/Videos');
    print(videosDirectory.existsSync());

    await checkAllFiles();
    super.onInit();
  }
}
