import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/newLife/controller/newLife_controller.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_images.dart';
import 'newLife_course_Screen.dart';

class NewLifeScreen extends StatelessWidget {
  NewLifeScreen({super.key});

  final NewLifeController newLifeController = Get.put(NewLifeController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Obx(()=>
      newLifeController.isLoading.value?
      const Scaffold(body: Center(child: CircularProgressIndicator(),),):
      Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.kPrimaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('NewLife Lessons',style: Styles.textStyle18Godlen,),
              ClipRRect(
                  borderRadius: 10.cBorder,
                  child: SizedBox.fromSize(
                      size: const Size(40 ,40),
                      child: Image.asset(AppImages.logo,fit: BoxFit.fill,)))
            ],
          ),
          bottom: TabBar(
            tabs: [
              Tab(child: Text(newLifeController.newLifeModel.courses![0].title!,style: Styles.textStyle14Green,)),
              Tab(child: Text(newLifeController.newLifeModel.courses![1].title!,style: Styles.textStyle14Green)),
              Tab(child: Text(newLifeController.newLifeModel.courses![2].title!,style: Styles.textStyle14Green)),
              Tab(child: Text(newLifeController.newLifeModel.courses![3].title!,style: Styles.textStyle14Green)),
            ],
          ),
        ),
        backgroundColor: AppColors.kWhiteColor,
        body: TabBarView(
          children: [
            NewLifeCourseScreen(index:0),
            NewLifeCourseScreen(index:1),
            NewLifeCourseScreen(index:2),
            NewLifeCourseScreen(index:3)
          ],
        ),
      )),
    );
  }
}


