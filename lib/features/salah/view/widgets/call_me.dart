import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_images.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class CallMe extends StatelessWidget {
  final String message;
  final String whatsapp;
  final String messenger;

  const CallMe(
      {super.key,
      required this.whatsapp,
      required this.messenger,
      required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () async {
            lunch(whatsapp + message);
          },
          child: SizedBox(
              height: 50, width: 50, child: Image.asset(AppImages.whatsapp)),
        ),
        10.hSize,
        InkWell(
          onTap: () async {
            lunch(messenger + message);
          },
          child: SizedBox(
              height: 40,
              width: 40,
              child: Image.asset(AppImages.facebookMessenger)),
        ),
      ],
    );
  }

  void lunch(String url) async {
    try {
      //if (await canLaunchUrl(Uri.parse(url))) {
      await launch(url);
      /*} else {
        throw 'Could not launch ${url}';
      }*/
    } catch (e) {
      print('erorrrrrrrrrrrrrrrrrrr $e');
      // showSnackbar('e $e');
    }
  }
}
