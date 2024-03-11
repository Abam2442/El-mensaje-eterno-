import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_jsons.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_routes.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_svgs.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/context_size.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/views/pages/LearnSalah/PracticalLearn/salah_practical_page.dart';
import 'package:hiwayda_oracion_islamica/views/pages/LearnSalah/PracticalLearn/wudu_practical_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PracticalLearnPage extends StatefulWidget {
  const PracticalLearnPage({Key? key}) : super(key: key);

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
            margin: EdgeInsets.only(top: context.height * 0.05),
            width: context.width,
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
                              width: context.width,
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
                                ItsOptions(
                                  label: 'Wudu',
                                  image: AppSvgs.wudoa,
                                  onTap: () {
                                    AppRoutes.routeTo(
                                        context,
                                        WuduPracticalPage(
                                            jsonFile: AppJsons.wudu));
                                  },
                                ),
                                ItsOptions(
                                  label: 'FAJR',
                                  image: AppSvgs.fajr,
                                  onTap: () {
                                    print('in fajr');
                                    AppRoutes.routeTo(
                                        context,
                                        SalahPracticalPage(
                                            jsonFile: AppJsons.fajr));
                                  },
                                ),
                                ItsOptions(
                                  label: 'DUHR',
                                  image: AppSvgs.duhr,
                                  onTap: () {
                                    AppRoutes.routeTo(
                                        context,
                                        SalahPracticalPage(
                                            jsonFile: AppJsons.duhr));
                                  },
                                ),
                                ItsOptions(
                                  label: 'ASR',
                                  image: AppSvgs.asr,
                                  onTap: () {
                                    AppRoutes.routeTo(
                                        context,
                                        SalahPracticalPage(
                                            jsonFile: AppJsons.asr));
                                  },
                                ),
                                ItsOptions(
                                  label: 'MAGHRIB',
                                  image: AppSvgs.maghrib,
                                  onTap: () {
                                    AppRoutes.routeTo(
                                        context,
                                        SalahPracticalPage(
                                            jsonFile: AppJsons.magrib));
                                  },
                                ),
                                ItsOptions(
                                  label: 'ISHA',
                                  image: AppSvgs.isha,
                                  onTap: () {
                                    AppRoutes.routeTo(
                                        context,
                                        SalahPracticalPage(
                                            jsonFile: AppJsons.isha));
                                  },
                                ),
                              ],
                            ),

/*
                            _builSalahTime(
                                image: AppSvgs.wudoa,
                                title: 'WUDU',
                                onTap: () {
                                  AppRoutes.routeTo(
                                      context,
                                      SalahPracticalPage(
                                          jsonFile: AppJsons.fajr));
                                },
                                color: wudoColor),
                            _builSalahTime(
                                image: AppSvgs.fajr,
                                title: 'FAJR',
                                onTap: () {
                                  AppRoutes.routeTo(
                                      context,
                                      SalahPracticalPage(
                                          jsonFile: AppJsons.fajr));
                                },
                                color: fajrColor),
                            _builSalahTime(
                                image: AppSvgs.duhr,
                                title: 'DUHR',
                                onTap: () {
                                  AppRoutes.routeTo(
                                      context,
                                      SalahPracticalPage(
                                        jsonFile: AppJsons.duhr,
                                      ));
                                },
                                color: duhrColor),
                            _builSalahTime(
                                image: AppSvgs.asr,
                                title: 'ASR',
                                onTap: () {
                                  AppRoutes.routeTo(
                                      context,
                                      SalahPracticalPage(
                                        jsonFile: AppJsons.asr,
                                      ));
                                },
                                color: asrColor),
                            _builSalahTime(
                                image: AppSvgs.maghrib,
                                title: 'MAGHRIB',
                                onTap: () {
                                  AppRoutes.routeTo(
                                      context,
                                      SalahPracticalPage(
                                        jsonFile: AppJsons.magreb,
                                      ));
                                },
                                color: maghribColor),
                            _builSalahTime(
                                image: AppSvgs.isha,
                                title: 'ISHA',
                                onTap: () {
                                  AppRoutes.routeTo(
                                      context,
                                      SalahPracticalPage(
                                        jsonFile: AppJsons.isha,
                                      ));
                                },
                                color: ishaColor),*/
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ),

          /*
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: (context.height * 0.08).toInt().vEdge,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(child: Text('Practico Aprende a orar',style: TextStyle(color: Colors.white,fontSize: 24),)),
                      */
          /*Container(
                        width: context.width,
                        height: context.height,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.transparent
                          //selectedBackColor,
                        ),
                      ),*/
          /*
                      */
          /*Padding(
                        padding: EdgeInsets.only(
                            top: context.height * 0.7, right: 0, left: 0),
                        child: InkWell(
                          onTap: () {
                            if(wudoColor == selectedBackColor){
                              Get.to(WuduPracticalPage(jsonFile: AppJsons.wudu));
                            }
                            else if(fajrColor == selectedBackColor){
                              Get.to(SalahPracticalPage(jsonFile: AppJsons.fajr));
                            }else if(duhrColor == selectedBackColor){
                              Get.to(SalahPracticalPage(jsonFile: AppJsons.duhr,));
                            }else if(asrColor == selectedBackColor){
                              Get.to(SalahPracticalPage(jsonFile: AppJsons.asr,));
                            }else if(maghribColor == selectedBackColor){
                              Get.to(SalahPracticalPage(jsonFile: AppJsons.magreb,));
                            }else if(ishaColor == selectedBackColor){
                              Get.to(SalahPracticalPage(jsonFile: AppJsons.isha,));
                            }
                          },
                          child: Stack(children: [
                            Center(
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: AppColors.kWhiteColor,
                                    ),
                                    child: SvgPicture.asset(AppSvgs.button))),
                            Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10, left: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text('Start Learn '),
                                      Icon(Icons.arrow_forward),
                                    ],
                                  ),
                                )),
                          ]),
                        ),
                      ),*/
          /*
                      */
          /*if((wudoColor==null))
                      Positioned(
                          right: context.width * 0.25,
                          top: context.height * 0.15,
                          child: SvgPicture.asset(prayerImage)),*/
          /*
                      */
          /*if((wudoColor==null))
                      Positioned(
                          right: context.width * 0.1,
                          top: context.height * 0.1,
                          child: SvgPicture.asset(AppSvgs.clouds)),*/
          /*
                     */
          /* Center(
                          child: SizedBox(
                            height: context.height*0.5,
                              width: context.width*0.5,
                              child: SvgPicture.asset((wudoColor!=null)? AppSvgs.wudoa:AppSvgs.SagedMan))),*/
          /*
                      Padding(
                        padding: (context.height * 0.08).toInt().vEdge,
                        child: Container(
                          width: context.width * 0.8,
                          height: context.height * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            //color: AppColors.kWhiteColor,
                            color: Colors.transparent,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),*/
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
