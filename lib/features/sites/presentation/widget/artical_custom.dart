import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/services/easy_loader_service.dart';

class ArticalCustom extends StatelessWidget {
  final String dataText;
  final String title;
  const ArticalCustom({
    super.key,
    required this.dataText,
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      appBar: AppBarCustom(title: title, actions: [
        IconButton(
            onPressed: () async {
              var data = ClipboardData(text: dataText);
              await Clipboard.setData(data);
              EasyLoaderService.showToast(message: "Copied");
            },
            icon: const Icon(
              Icons.copy,
              color: AppColors.kWhiteColor,
            )),
      ]).customAppBar(context),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: SingleChildScrollView(
          child: Linkify(
            onOpen: _opnenLink,
            text: dataText,
            style: const TextStyle(
              fontSize: 18,
              height: 1.5,
            ),
            textAlign: TextAlign.justify,
            linkStyle: Styles.telegramMessagesLinksStyle,
          ),
        ),
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
