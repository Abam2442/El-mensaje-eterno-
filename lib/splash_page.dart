import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_images.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/features/salah/model/tahara_lesson_model.dart';
import 'package:hiwayda_oracion_islamica/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';

import 'core/constants/app_public_var.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashBody();
  }
}

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  _SplashBodyState createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {


  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    AppPublicVar.taharaLessons = await TaharaLessonFromJson.getData();
   goToNextView();
  }
  void goToNextView() {
    Future.delayed(const Duration(seconds: 1), () {
      Get.off(()=> HomeScreen());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // widthFactor: context.width,
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
                height: 100,
                //fit: BoxFit.fitWidth,
              ),
              Container(
                padding: 10.aEdge,
                  margin: 10.aEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.kGoldenColor.withOpacity(0.9)),
                  child: Text(
                    'De Ubada ibn Al Sámit que el Mensajero de Allah ﷺ dijo:\n'
                    '“Hay cinco oraciones que Allah ha prescrito para los hombres. Quien los cumpla con la atención que requieren sin faltar a ninguno de sus pilares obtiene la promesa de Allah de hacerle entrar en el Paraíso.\n'
                    'Quien no los cumpla no tiene ninguna promesa de Allah. Si quiere lo atormentará y si quiere lo hará entrar en el Paraíso.”'
                    'Al Albáni clasificó este hadiz como autentico.',
                    style: AppTextStyles.h6logo,
                  ))

              /*Container(
                    height: 100,
                    width: double.infinity,
                    child: Image.asset(AppImages.logo)
                ),*/
            ],
          ),
        ),
      ),
    );
  }


}
