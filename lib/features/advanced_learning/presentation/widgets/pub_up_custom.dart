import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_colors.dart';

class PubUpCustom extends StatelessWidget {
  final String body;
  final String link;
  const PubUpCustom(
      {super.key,
      this.body =
          'The rights are reserved to the owners of the site and this application to easily browse information, copy and search within the content. If you want to search for more information, please go to the original site.',
      this.link = '"https://rasoulallah.net/es/"'});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: AppColors.kWhiteColor,
        actions: [
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text(
                "Ok",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.kPrimaryColor),
              ))
        ],
        title: const Text("Note"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  body,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              InkWell(
                onTap: () async {
                  await launchUrl(Uri.parse(link));
                },
                child: Text(
                  link,
                  style: const TextStyle(
                      decoration: TextDecoration.underline, fontSize: 16),
                ),
              )
            ],
          ),
        ));
  }
}
