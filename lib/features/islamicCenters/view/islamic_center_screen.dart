import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/features/islamicCenters/view/countries_Screen.dart';
import '../../../core/widgets/custom_listTile.dart';
import '../controller/islamic_center_controller.dart';

class IslamicCenterScreen extends StatelessWidget {
  IslamicCenterScreen({super.key});

  final IslamicCenterController islamicCenterController = Get.put(IslamicCenterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      appBar: AppBar(
        title:const Center(child: Text('Islamic Centers'),),
      ),
      body: Obx(
            () => islamicCenterController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: islamicCenterController.islamicCenterModel.countries!.length,
          itemBuilder: ((context, index) {
            return CustomListTile(
              index: index,
              title: islamicCenterController.islamicCenterModel.countries![index].countryName!,
              onTap: (){
                Get.to(()=> CountriesScreen(countryIndex: index,));
              },
            );
          }),
        ),
      ),
    );
  }
}
