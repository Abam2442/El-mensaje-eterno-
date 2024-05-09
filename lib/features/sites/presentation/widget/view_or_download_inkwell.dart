import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/services/download_services.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewOrDownloadInkwell extends StatelessWidget {
  ViewOrDownloadInkwell(
      {super.key,
      required this.url,
      required this.name,
      required this.fileType,
      this.mediaLinkType = MediaLinkType.viewAndDownload}) {
    if (mediaLinkType == MediaLinkType.downloadOnly ||
        mediaLinkType == MediaLinkType.viewAndDownload) {
      _downloadServices = Get.find();
    }
  }
  final MediaLinkType mediaLinkType;
  final String url;
  final String name;
  final String fileType;
  late final DownloadServices _downloadServices;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (mediaLinkType == MediaLinkType.downloadOnly) {
          _download();
        } else {
          _view();
        }
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        margin: const EdgeInsets.only(top: 15, right: 15, left: 15),
        decoration: BoxDecoration(
            color: AppColors.kGreenColor,
            border: Border.all(color: AppColors.kGreenColor),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Expanded(
              child: Text(
                name,
                style: const TextStyle(
                    color: AppColors.kGoldenColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              color: AppColors.kWhiteColor,
              width: 1,
              height: 40,
            ),
            if (mediaLinkType == MediaLinkType.downloadOnly ||
                mediaLinkType == MediaLinkType.viewAndDownload)
              IconButton(
                  onPressed: _download,
                  icon: const Icon(
                    Icons.download,
                    color: Colors.white,
                  )),
            if (mediaLinkType == MediaLinkType.viewAndDownload ||
                mediaLinkType == MediaLinkType.viewAndDownload)
              IconButton(
                  onPressed: _view,
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  )),
          ],
        ),
      ),
    );
  }

  _download() {
    _downloadServices.download(url: url, fileName: "$name.$fileType");
  }

  _view() {
    launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }
}

enum MediaLinkType { downloadOnly, viewOnly, viewAndDownload }
