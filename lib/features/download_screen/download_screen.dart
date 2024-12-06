import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/features/download_screen/controller/download_screen_controller.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DownloadScreenController());
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: const BoxDecoration(
                color: AppColors.kPrimaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Download Screen',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20, color: Colors.white, fontFamily: 'Poppins'),
                ),
                Text(
                  'Make Your Application Offline',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20, color: Colors.white, fontFamily: 'Poppins'),
                )
              ],
            ),
          ),
          GetBuilder<DownloadScreenController>(builder: (controller) {
            return ListView.builder(
                itemCount: controller.sectionData.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(controller.sectionData[index].title),
                        subtitle: Text(controller.sectionData[index].subTitle),
                        onTap: () => controller.downloadSectionTwoVideos(),
                        trailing: SizedBox(
                          width: 88,
                          child: Row(
                            children: [
                              controller.sectionData[index].isDownload
                                  ? Text(
                                      controller.stateType != StateType.success
                                          ? 'Loading....'
                                          : 'Downloaded')
                                  : TextButton(
                                      onPressed: () =>
                                          controller.downloadFiles(index),
                                      child: const Text('Download')),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                });
          }),
          GetBuilder<DownloadScreenController>(builder: (controller) {
            return controller.downloadedFiles == 0
                ? const SizedBox()
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: LinearProgressIndicator(
                          minHeight: 20,
                          borderRadius: BorderRadius.circular(20),
                          value: controller.downloadedFiles /
                              controller.totalFiles,
                        ),
                      ),
                      Text(
                          'Downloading ${controller.downloadedFiles}/${controller.totalFiles} files')
                    ],
                  );
          })
        ],
      ),
    );
  }
}
