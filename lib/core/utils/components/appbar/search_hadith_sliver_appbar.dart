import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/controller/hadith_controller.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import 'direction_aware.dart';

class SearchHadithSliverAppBarWidget extends StatelessWidget {
  final bool? isSearch;
  final Color backgroundColor;
  final Color iconColor;
  final bool isPinned;
  final String title;
  final bool hasTranslator;
  final HadithController controller;
  final bool isHadithenc;
  const SearchHadithSliverAppBarWidget({
    super.key,
    this.isSearch,
    this.backgroundColor = AppColors.kPrimaryColor,
    this.iconColor = AppColors.kWhiteColor,
    this.title = '',
    this.isPinned = false,required this.isHadithenc,
    this.hasTranslator = false,required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      leading: !Navigator.canPop(context)
          ? null
          : DirectionAware(
              // من شان تدوير الايقونة بزاوية 90
              //DirectionAware for rotate the icon to other side rtl or ltr
              child: IconButton(
                onPressed: (){
                  controller.isBack.value = false;
                  controller.searchTextController.text = "";
                  controller.isSearching.value = false;
                  Navigator.pop(context);
                  if(isHadithenc) {
                    controller.getbookHadithesName;
                    controller.update();
                  }

                },
                icon: SvgPicture.asset(
                  AppAssets.kBackIcon,
                  color: iconColor,
                ),
              ),
            ),
      centerTitle: true,
      actions: [
        GestureDetector(onTap: (){
          controller.isSearching.value = !controller.isSearching.value;
          if(!controller.isSearching.value){
            controller.searchTextController.text = '';
            controller.update();
          } else {
             controller.searchFocusNode.requestFocus();
          }
        },child: Container(margin: const EdgeInsets.only(right: 10),child:
        Obx(()=>Icon(controller.isSearching.value?Icons.close:Icons.search,color: Colors.white,size: 26,),)))],
      title: Obx(()=>controller.isSearching.value?  TextField(controller: controller.searchTextController,
        focusNode: controller.searchFocusNode,onChanged: (text){
          controller.pageNumber = 0;
          controller.bookHadithesNameForList.clear();
          controller.subCategoryHadithesNameForList.clear();
          controller.update();
        },decoration: const InputDecoration(hintText: "Serĉu ĉi tie",hintStyle: TextStyle(color: Colors.white70
        ,fontSize: 16)),
        style: const TextStyle(color: Colors.white,fontSize: 16),textAlign: TextAlign.center,):
      Text(Get.arguments["title"],style: const TextStyle(color: AppColors.kGoldenColor),)),

      floating: true,
      snap: true,
      elevation: 0,
      pinned: isPinned,
    );
  }
}
