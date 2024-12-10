import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/download_screen/controller/download_screen_controller.dart';
import 'package:hiwayda_oracion_islamica/features/download_screen/download_status.dart';

class SelectionWidget extends StatelessWidget {
  const SelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DownloadScreenController>(builder: (controller) {
      return ListView.builder(
          itemCount: controller.sectionData.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  title: Text(controller.sectionData[index].title),
                  subtitle: Text(controller.sectionData[index].subTitle),
                  // onTap: () => controller.downloadSectionTwoVideos(),
                  trailing: SizedBox(
                    width: 88,
                    child: Row(
                      children: [
                        if (controller.sectionData[index].isDownload)
                          const Text('Downloaded')
                        else if (controller.downloadStatus ==
                            DownloadStatus.downloading)
                          const Text('Loading....')
                        else if (controller.downloadStatus ==
                            DownloadStatus.checking)
                          const Text('Checking...')
                        else
                          TextButton(
                              onPressed: () => controller.downloadFiles(index),
                              child: const Text('Download'))
                      ],
                    ),
                  ),
                ),
              ],
            );
          });
    });
  }
}
