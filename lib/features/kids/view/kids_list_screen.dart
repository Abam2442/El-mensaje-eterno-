import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hiwayda_oracion_islamica/features/home/presentation/widgets/home_card.dart';

import '../../../../core/constants/app_colors.dart';

import '../../../core/utils/components/appbar/build_sliver_appbar.dart';
import '../controller/kids_controller.dart';
import '../model/kids_model.dart';
import 'kids_card.dart';


class kidswidgetsHomeScreen extends GetView<KidsController> {
  const kidswidgetsHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

  KidsModel  kidsModel=controller.kidsModel.value;

    return Scaffold(
      appBar: AppBar(
        title:Text("El nino musulmán") ,
        backgroundColor: AppColors.kGreenColor,
        centerTitle: true,
      ),
      body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            decoration: const BoxDecoration(
              color: AppColors.kWhiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: ListView.builder(

                itemCount: kidsModel.lessons?.length,
                shrinkWrap: true,
                physics: ScrollPhysics()
                  ,itemBuilder: (context,index){
                  print(controller.LessonIndex.value);
                //  print("controller.LessonIndex.value");
                  print(kidsModel.lessons?[index]);
                    return kidsCard(
                      kidsLessons  :kidsModel.lessons![index],
                      indexLessons: index,
                    );
                  })
      ),
    );

  }



}
