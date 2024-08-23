import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_images.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/about/model/developer_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperCard extends StatelessWidget {
  final DeveloperModel developerModel;

  const DeveloperCard({super.key, required this.developerModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: Get.height * 0.1,
        decoration: const BoxDecoration(
          color: AppColors.kGreenColor,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: IntrinsicHeight(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    developerModel.name!,
                    style: Styles.textStyle16Golden,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (developerModel.whatsapp != '')
                        getSocial(developerModel.whatsapp!, AppImages.whatsapp),
                      10.wSize,
                      if (developerModel.facebook != '')
                        getSocial(developerModel.facebook!, AppImages.facebook),
                      10.wSize,
                      if (developerModel.linkedin != '')
                        getSocial(developerModel.linkedin!, AppImages.linkedin),
                    ],
                  )
                ],
              ),
              InkWell(
                onTap: () async {
                  connectWithEmail(developerModel.gmail!);
                },
                child: Text(
                  developerModel.gmail!,
                  style: Styles.textStyle14primary,
                  overflow: TextOverflow.clip,
                  maxLines: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getSocial(String address, String icon) {
    return InkWell(
      onTap: () async {
        var path = address;
        if (path != '') {
          Uri uri = Uri.parse(path);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          } else {
            throw 'Could not launch $path';
          }
        }
      },
      child: SizedBox(height: 25, child: Image(image: AssetImage(icon))),
    );
  }

  void connectWithEmail(String email) async {
    final Uri params = Uri(scheme: 'mailto', path: email);
    String url = params.toString();
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        if (!await launchUrl(Uri.parse(url))) {
          Get.snackbar('info', 'Could not launch $url');
        }
      }
    } on SocketException catch (_) {
      Get.defaultDialog(
        title: 'تنبيه',
        middleText: 'الرجاء التأكد من الاتصال بالانترنت ثم المحاولة مجدداً',
        textConfirm: 'موافق',
        onConfirm: () {
          Get.back();
        },
        textCancel: 'رجوع',
      );
    }
  }
}
