import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/mooamalat/controller/mooamalat_controller.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/custom_listTile.dart';

import 'mooamalat_course_Screen.dart';

class MooamalatScreen extends StatelessWidget {
  MooamalatScreen({super.key});

  final MooamalatController mooamalatController = Get.put(MooamalatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Center(child: Text('Mooamalat Lessons'),),
      ),
      body: Obx(
        () => mooamalatController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: mooamalatController.mooamalatModel.courses!.length,
                itemBuilder: ((context, index) {
                  return CustomListTile(
                    index: index,
                    title: mooamalatController.mooamalatModel.courses![index].title!,
                    onTap: () {
                      Get.to(()=> MooamalatCourseScreen(index:index));
                    },
                  );
                }),
              ),
      ),
    );
  }
}
