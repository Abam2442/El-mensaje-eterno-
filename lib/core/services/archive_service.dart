import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
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
      Get.find<Logger>().i("Start extractFile |ArchiveService|");
      bool? isExtracted = sharedPreferencesService.getData<bool>(key: AppKeys.isExtracted);
      if ((isExtracted != null && !isExtracted) || isExtracted == null) {
        EasyLoaderService.showLoading();
        ByteData data = await rootBundle.load(AppAssets.json);
        List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

        Directory appDir = await getApplicationDocumentsDirectory();
        final zipFile = await File('${appDir.path}/Json.zip').writeAsBytes(bytes);

        await ZipFile.extractToDirectory(
            zipFile: zipFile,
            destinationDir: appDir,
            onExtracting: (zipEntry, progress) {
              Get.find<Logger>().w(zipEntry.name);
              sharedPreferencesService.setData(
                key: zipEntry.name,
                value: '${appDir.path}/${zipEntry.name}',
              );
              return ZipFileOperation.includeItem;
            });
        await sharedPreferencesService.setData(key: AppKeys.isExtracted, value: true);
        zipFile.deleteSync();
        EasyLoaderService.dismiss();
      }
    } catch (e, s) {
      EasyLoaderService.dismiss();
      EasyLoaderService.showError(message: "Error in Extracting");
      Get.find<Logger>().w("End extractFile |ArchiveService| extraction failed $e ,$s");
    }
  }

  Future<String?> readFile({required String name}) async {
    try {
      Get.find<Logger>().i("Start `readFile` in |ArchiveService|");
      bool? isExtracted = sharedPreferencesService.getData<bool>(
        key: AppKeys.isExtracted,
      );
      if (isExtracted != null && isExtracted) {
        String? path = sharedPreferencesService.getData<String>(key: name);
        if (path != null) {
          final file = File(path);
          if (await file.exists()) {
            String fileContent = await file.readAsString();
            Get.find<Logger>().w("End `readFile` in |ArchiveService|");
            return fileContent;
          } else {
            EasyLoaderService.showToast(message: "File not exist");
          }
        } else {
          EasyLoaderService.showToast(message: "File path not found");
        }
      } else {
        await extractFile();
        await readFile(name: name);
      }
      Get.find<Logger>().w("End `readFile` in |ArchiveService|");
      return null;
    } catch (e) {
      Get.find<Logger>().e("End `readFile` in |ArchiveService| Exception: ${e.runtimeType}");
      rethrow;
    }
  }
}
