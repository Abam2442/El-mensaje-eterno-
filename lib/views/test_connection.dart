import 'package:hiwayda_oracion_islamica/core/constants/app_images.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_strings.dart';
import 'package:hiwayda_oracion_islamica/views/widgets/call_me.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TestConnection extends StatelessWidget {
  const TestConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: () async {
                  var path = 'http://www.youtube.com';
                  Uri uri = Uri.parse(path);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  } else {
                    throw 'Could not launch ${path}';
                  }
                },
                child: Container(
                    width: 200,
                    height: 200,
                    child: Image.asset(AppImages.youtube))),
            CallMe(whatsapp: AppStrings.whatsappAbout,
                messenger: AppStrings.messengerAbout,
                message: 'Hi How Are You'),
          ],
        ),
      )),
    );
  }
}
