import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hiwayda_oracion_islamica/features/home/presentation/widgets/home_card.dart';

import '../../../../core/constants/app_colors.dart';
import '../controller/home_controller.dart';

class SectionswidgetsHomeScreen extends StatelessWidget {
  final RxList<HomeCardData> data;

  const SectionswidgetsHomeScreen({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      decoration: const BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(children: [
        Obx(() => data.isEmpty
            ? SizedBox(
                height: Get.height * 0.6,
                child: const Center(
                  child: Text(
                    "neniuj rezultoj",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              )
            : ListView.builder(
                itemCount: data.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) {
                  return HomeCard(
                    homeCardData: data[index],
                  );
                }))
      ]),
    );
  }
}
