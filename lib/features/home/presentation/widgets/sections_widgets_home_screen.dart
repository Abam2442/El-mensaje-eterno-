import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/home/presentation/widgets/home_card.dart';

import '../controller/home_controller.dart';

class SectionswidgetsHomeScreen extends StatelessWidget {
  final RxList<HomeCardData> data;

  const SectionswidgetsHomeScreen({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return HomeCard(
                  homeCardData: data[index],
                );
              })),
      const SizedBox(
        height: 100,
      )
    ]);
  }
}
