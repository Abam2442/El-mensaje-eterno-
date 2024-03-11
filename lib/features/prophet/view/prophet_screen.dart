import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/prophet/controller/prophet_controller.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_images.dart';
import 'prophet_course_Screen.dart';

class ProphetScreen extends StatelessWidget {
  ProphetScreen({super.key});

  final ProphetController prophetController = Get.put(ProphetController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Obx(()=>
      prophetController.isLoading.value?
      const Scaffold(body: Center(child: CircularProgressIndicator(),),):
      Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.kPrimaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Prophet Lessons',style: Styles.textStyle18Godlen,),
              ClipRRect(
                  borderRadius: 10.cBorder,
                  child: SizedBox.fromSize(
                      size: const Size(40 ,40),
                      child: Image.asset(AppImages.logo,fit: BoxFit.fill,)))
            ],
          ),
          bottom: TabBar(
            tabs: [
              Tab(child: Text(prophetController.prophetModel.courses![0].title!,style: Styles.textStyle14Green,)),
              Tab(child: Text(prophetController.prophetModel.courses![1].title!,style: Styles.textStyle14Green)),
            ],
          ),
        ),
        backgroundColor: AppColors.kWhiteColor,
        body: TabBarView(
          children: [
            ProphetCourseScreen(index:0),
            ProphetCourseScreen(index:1)
          ],
        ),
      )),
    );
  }
}


