import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/home/presentation/controller/home_controller.dart';
import 'package:hiwayda_oracion_islamica/features/home/presentation/widgets/sections_widgets_home_screen.dart';

import '../../../core/constants/app_colors.dart';

class NewMuslimHomeScreen extends StatelessWidget {
  NewMuslimHomeScreen({super.key});

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      appBar: AppBar(
        title: Obx(()=>homeController.isSearching.value?  TextField(controller: homeController.searchTextController,
      focusNode: homeController.searchFocusNode,onChanged: (text){

           homeController.filterNewMuslimHomeCardsData(text);

      },decoration: const InputDecoration(hintText: "Serĉu ĉi tie",hintStyle: TextStyle(color: Colors.white70
          ,fontSize: 16)),
      style: const TextStyle(color: Colors.white,fontSize: 16),textAlign: TextAlign.center,):const Text(
          "Equipaje del nuevo musulmán",
          style: Styles.textStyle18Godlen,
        )),
        backgroundColor: AppColors.kPrimaryColor,
        iconTheme: const IconThemeData(color: AppColors.white),
        actions: [
          GestureDetector(onTap: (){
            homeController.isSearching.value = !homeController.isSearching.value;
            if(!homeController.isSearching.value){
              homeController.newMuslimHomeCardsDataNewList.clear();
              homeController.newMuslimHomeCardsDataNewList.addAll(homeController.newMuslimHomeCardsData);
              homeController.searchTextController.text = '';
              homeController.update();
            } else {
              homeController.searchFocusNode.requestFocus();
            }
          },child: Container(margin: const EdgeInsets.only(right: 10),child:
          Obx(()=>Icon(homeController.isSearching.value?Icons.close:Icons.search,color: Colors.white,size: 26,),)))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SectionswidgetsHomeScreen(data: homeController.newMuslimHomeCardsDataNewList),
          ],
        ),
      ),
    );
  }
}
