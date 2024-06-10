import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      appBar: AppBar(
        title: const Text(
          "Guía para usar la aplicación",
          style: Styles.textStyle20Golden,
        ),
        backgroundColor: AppColors.kPrimaryColor,
        iconTheme: const IconThemeData(
          color: AppColors.kGoldenColor,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: 16.aEdge,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    10.hSize,
                    const Text(
                      '''Contáctenos
''',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.start,
                    ),
                    GestureDetector(
                      onTap: () =>
                          launchUrl(Uri.parse('https://Wa.me/+201090578754')),
                      child: const Text(
                        'WhatsApp',
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => launchUrl(
                          Uri.parse('https://www.facebook.com/bassem2442')),
                      child: const Text(
                        'Facebook',
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () =>
                          launchUrl(Uri.parse('https://T.me/Abam2442')),
                      child: const Text(
                        'Telegram',
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                        textAlign: TextAlign.start,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
