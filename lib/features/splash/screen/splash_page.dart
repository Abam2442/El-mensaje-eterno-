import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/features/splash/controller/splash_page_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashPageController());
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.kPrimaryColor,
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [AppColors.kPrimaryColor, AppColors.kPrimaryColor]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppAssets.logoApp,
                height: 150,
              ),
              Container(
                  padding: 10.aEdge,
                  margin: 10.aEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.kGoldenColor.withOpacity(0.9)),
                  child: Text(
                    '''
El Corán es un Mensaje para toda la humanidad
Para aquellos de ustedes que deseen permanecer firmes en el camino de la verdad
El Corán 81:27-28''',
                    style: AppTextStyles.h6logo,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
