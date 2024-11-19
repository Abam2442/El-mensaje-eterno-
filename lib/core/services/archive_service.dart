import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../constants/app_assets.dart';
import '../constants/app_keys.dart';
import 'easy_loader_service.dart';
import 'shared_preferences_service.dart';

class ArchiveService extends GetxService {
  final SharedPreferencesService sharedPreferencesService;

  ArchiveService({required this.sharedPreferencesService});

  @override
  void onInit() async {
    await extractFile();
    super.onInit();
  }

  Future<void> extractFile() async {
    try {
      bool? isExtracted =
          sharedPreferencesService.getData<bool>(key: AppKeys.isExtracted);
      if ((isExtracted != null && !isExtracted) || isExtracted == null) {
        // EasyLoaderService.showLoading();
        ByteData data = await rootBundle.load(AppAssets.json);
        List<int> bytes =
            data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

        Directory appDir = await getApplicationDocumentsDirectory();
        final zipFile =
            await File('${appDir.path}/Json.zip').writeAsBytes(bytes);

        await ZipFile.extractToDirectory(
            zipFile: zipFile,
            destinationDir: appDir,
            onExtracting: (zipEntry, progress) {
              sharedPreferencesService.setData(
                key: zipEntry.name,
                value: '${appDir.path}/${zipEntry.name}',
              );
              return ZipFileOperation.includeItem;
            });
        await sharedPreferencesService.setData(
            key: AppKeys.isExtracted, value: true);
        zipFile.deleteSync();
        // EasyLoaderService.dismiss();
      }
    } catch (e) {
      // EasyLoaderService.dismiss();
      // EasyLoaderService.showError(message: "Error in Extracting");
    }
  }

  Future<String?> readFile({required String name}) async {
    try {
      bool? isExtracted = sharedPreferencesService.getData<bool>(
        key: AppKeys.isExtracted,
      );
      if (isExtracted != null && isExtracted) {
        String? path = sharedPreferencesService.getData<String>(key: name);
        if (path != null) {
          final file = File(path);
          if (await file.exists()) {
            String fileContent = await file.readAsString();

            return fileContent;
          } else {
            print('1');
            // EasyLoaderService.showToast(message: "File not exist");
          }
        } else {
          print('11111111');

          // EasyLoaderService.showToast(message: "File path not found");
        }
      } else {
        print('asdadadsas');
        await extractFile();
        await readFile(name: name);
      }
      print('adasdasdasdasdasdafadf');
      return null;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
