import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_jsons.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_routes.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_svgs.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/salah_practical_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/wudu_practical_page.dart';
import 'package:hiwayda_oracion_islamica/features/ui_rone_screen/ui_rone_screen.dart';

class PracticalLearnPage extends StatefulWidget {
  PracticalLearnPage({Key? key, required this.level}) : super(key: key);
  final int level;

  @override
  State<PracticalLearnPage> createState() => _PracticalLearnPageState();
}

class _PracticalLearnPageState extends State<PracticalLearnPage> {
  Color selectedBackColor = AppColors.kPrimaryColor;
  Color? wudoColor, fajrColor, duhrColor, asrColor, maghribColor, ishaColor;
  String prayerImage = AppSvgs.fajr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        body: SafeArea(
          child: Container(
            padding: 10.hEdge,
            margin: EdgeInsets.only(top: Get.height * 0.05),
            width: Get.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
              color: AppColors.kWhiteColor,
            ),
            child: Padding(
                padding: 20.aEdge,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Practico Aprende a orar',
                      style: Styles.textStyle24Black,
                    ),
                    15.hSize,
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              padding: 10.aEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColors.kWhiteColor.withOpacity(0.4),
                              ),
                              width: Get.width,
                              child: Text(
                                'De Ubada ibn Al Sámit que el Mensajero de Allah ﷺ dijo:\n'
                                    '\n'
                                    '"Hay cinco oraciones que Allah ha prescrito para los hombres. Quien los cumpla con la atención que requieren sin faltar a ninguno de sus pilares obtiene la promesa de Allah de hacerle entrar en el Paraíso.\n'
                                    'Quien no los cumpla no tiene ninguna promesa de Allah. Si quiere lo atormentará y si quiere lo hará entrar en el Paraíso.”\n'
                                    '\n'
                                    'Al Albáni clasificó este hadiz como autentico.'
                                ,
                                style: AppTextStyles.h5,
                              ),
                            ),
                            15.hSize,
                            GridView(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                childAspectRatio: 4,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                              ),
                              children: [
                                // ItsOptions(
                                //   label: 'Wudu',
                                //   image: AppSvgs.wudoa,
                                //   onTap: () {
                                //     Get.to(()=>WuduPracticalPage(
                                //         jsonFile: AppJsons.wudu));
                                //     //Get.to(()=> UiRoneScreen());
                                //   },
                                // ),
                                ItsOptions(
                                  label: 'FAJR',
                                  image: AppSvgs.fajr,
                                  onTap: () {
                                    switch(widget.level){
                                      case 0:
                                         Get.to(()=>SalahPracticalPage(jsonFile: AppJsons.fajr));
                                        break;
                                      case 1:
                                    Get.to(()=>UiRoneScreen(),arguments: {'file':AppJsons.fajrIntermediate});
                                        break;
                                      case 2:

                                        break;
                                    }

                                  },
                                ),
                                ItsOptions(
                                  label: 'DUHR',
                                  image: AppSvgs.duhr,
                                  onTap: () {


                                    switch(widget.level){
                                      case 0:
                                        Get.to(()=>SalahPracticalPage(
                                    jsonFile: AppJsons.duhr));
                                        break;
                                      case 1:
                                        Get.to(()=>UiRoneScreen(),arguments: {'file':AppJsons.ishaIntermediate});
                                        break;
                                      case 2:

                                        break;
                                    }
                                  },
                                ),
                                ItsOptions(
                                  label: 'ASR',
                                  image: AppSvgs.asr,
                                  onTap: () {

                                    switch(widget.level){
                                      case 0:
                                        Get.to(()=>SalahPracticalPage(
                                            jsonFile: AppJsons.asr));
                                        break;
                                      case 1:
                                        Get.to(()=>UiRoneScreen(),arguments: {'file':AppJsons.ishaIntermediate});
                                        break;
                                      case 2:

                                        break;
                                    }
                                  },
                                ),
                                ItsOptions(
                                  label: 'MAGHRIB',
                                  image: AppSvgs.maghrib,
                                  onTap: () {
                                    switch(widget.level){
                                      case 0:
                                        Get.to(()=>SalahPracticalPage(
                                            jsonFile: AppJsons.magrib));
                                        break;
                                      case 1:
                                        Get.to(()=>UiRoneScreen(),arguments: {'file':AppJsons.maghribIntermediate});
                                        break;
                                      case 2:

                                        break;
                                    }
                                  },
                                ),
                                ItsOptions(
                                  label: 'ISHA',
                                  image: AppSvgs.isha,
                                  onTap: () {
                                    switch(widget.level){
                                      case 0:
                                        Get.to(()=>SalahPracticalPage(
                                            jsonFile: AppJsons.isha));
                                        break;
                                      case 1:
                                        Get.to(()=>UiRoneScreen(),arguments: {'file':AppJsons.ishaIntermediate});
                                        break;
                                      case 2:

                                        break;
                                    }
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ),

        ));
  }

  void clearColor() {
    wudoColor = null;
    fajrColor = null;
    duhrColor = null;
    asrColor = null;
    maghribColor = null;
    ishaColor = null;
  }


}


class ItsOptions extends StatelessWidget {
  const ItsOptions({
    super.key,
    required this.label,
    required this.image,
    this.onTap,
  });

  final String label;
  final String image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: InkWell(

        onTap: onTap,
        child: Container(
           height: 10,
           width: 10,
          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(20),
            color: AppColors.kGreenColor,
          ),
          //padding: 16.vhEdge,
          child: Column(
            children: [
              Expanded(
                child: SvgPicture.asset(image),
              ),
              FittedBox(
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: AppTextColors.textStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
