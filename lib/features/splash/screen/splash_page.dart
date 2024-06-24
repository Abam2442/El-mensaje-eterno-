import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/features/splash/controller/splash_page_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ini controller
    Get.put(SplashPageController());

    return Scaffold(
      body: Stack(
        children: [
          // page color
          Container(
            color: AppColors.kPrimaryColor,

          ),

          //  add imegse to up screen
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              AppAssets.background, // new imges
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.5, //
            ),
          ),


          Column(
            children: [
              const Spacer(),

              // app logo
              SvgPicture.asset(
                AppAssets.logoApp,
                height: 100,
              ),

              const SizedBox(height: 20),

              // text
              Container(
                padding: 20.aEdge,
                margin: 10.aEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.kGoldenColor.withOpacity(0.6),
                ),
                child: Text(
                  '''
El Corán es un Mensaje para toda la humanidad
Para aquellos de ustedes que deseen permanecer firmes en el camino de la verdad
El Corán 81:27-28''',
                  style: AppTextStyles.h6logo.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 50),

              // skip button
              ElevatedButton.icon(
                onPressed: () {
                  Get.find<SplashPageController>().goToNextView();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kGoldenColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                ),
                icon: const Icon(Icons.arrow_forward, color: Colors.white),
                label: const Text(
                  'تخطى',
                  style: TextStyle(color: Colors.white),
                ),
              ),

              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
