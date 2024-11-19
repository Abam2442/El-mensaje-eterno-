import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/utils/components/appbar/direction_aware.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViweScreen extends StatefulWidget {
  final String title;
  final String Urlweb;
  const WebViweScreen({super.key, required this.Urlweb, required this.title});

  @override
  State<WebViweScreen> createState() => _WebViweScreenState();
}

class _WebViweScreenState extends State<WebViweScreen> {
  late final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(
      Uri.parse(
        widget.Urlweb,
      ),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: !Navigator.canPop(context)
            ? null
            : DirectionAware(
                // من شان تدوير الايقونة بزاوية 90
                //DirectionAware for rotate the icon to other side rtl or ltr
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 25,
                    ),
                    child: SvgPicture.asset(
                      AppAssets.kBackIcon,
                      color: AppColors.gray,
                    ),
                  ),
                ),
              ),
        backgroundColor: AppColors.kPrimaryColor,
        title: Text(
          widget.title,
          style: Styles.textStyle18Godlen,
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
