import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/download_screen/controller/download_screen_controller.dart';
import 'package:hiwayda_oracion_islamica/features/download_screen/download_status.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DownloadScreenController>(builder: (controller) {
      return controller.downloadStatus == DownloadStatus.downloading
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: LinearProgressIndicator(
                    minHeight: 20,
                    borderRadius: BorderRadius.circular(20),
                    value: controller.downloadedFiles / controller.totalFiles,
                  ),
                ),
                Text(
                    'Downloading ${controller.downloadedFiles}/${controller.totalFiles} files')
              ],
            )
          : const Text('There is no Problem');
    });
  }
}
