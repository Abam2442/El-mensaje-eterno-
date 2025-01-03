import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/services/easy_loader_service.dart';
import 'app_bar_custom.dart';

class ListViewCustom extends StatelessWidget {
  final String question;
  final String answer;
  const ListViewCustom({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBarCustom(title: "", actions: [
        IconButton(
            onPressed: () async {
              var data = ClipboardData(text: answer);
              await Clipboard.setData(data);
              EasyLoaderService.showToast(message: "Copied");
            },
            icon: const Icon(
              Icons.copy,
              color: AppColors.kWhiteColor,
            )),
      ]).customAppBar(context),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Pregunta:",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColors.kPrimaryColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SelectableText(
              question,
              textAlign: TextAlign.start,
              style: const TextStyle(
                  fontSize: 18, height: 1.5, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Respuesta:",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: AppColors.kPrimaryColor)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Linkify(
              onOpen: _opnenLink,
              text: answer,
              style: const TextStyle(
                fontSize: 18,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
              linkStyle: Styles.telegramMessagesLinksStyle,
            ),
          ),
        ],
      ),
    );
  }

  Future _opnenLink(LinkableElement link) async {
    final uri = Uri.parse(link.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      final Logger logger = Get.find();
      logger.e('failed to launch url :> ${uri.path}');
    }
  }
}
