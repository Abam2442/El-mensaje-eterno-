import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_colors.dart';

class PubUpCustom extends StatelessWidget {
  const PubUpCustom({super.key});

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
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "The rights are reserved to the owners of the site and this application to easily browse information, copy and search within the content. If you want to search for more information, please go to the original site.",
                style: TextStyle(fontSize: 18),
              ),
            ),
            InkWell(
              onTap: () async {
                await launchUrl(Uri.parse("https://rasoulallah.net/es/"));
              },
              child: const Text(
                "https://rasoulallah.net/es/",
                style: TextStyle(
                    decoration: TextDecoration.underline, fontSize: 16),
              ),
            )
          ],
        ));
  }
}
