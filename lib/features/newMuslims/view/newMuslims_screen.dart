import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/newMuslims/controller/newMuslims_controller.dart';
import '../../../core/widgets/custom_listTile.dart';
import 'newMuslims_course_Screen.dart';

class NewMuslimsScreen extends StatelessWidget {
  NewMuslimsScreen({super.key});

  final NewMuslimsController newMuslimsController =
      Get.put(NewMuslimsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('NewMuslims Lessons'),
        ),
      ),
      body: Obx(
        () => newMuslimsController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: newMuslimsController.newMuslimsModel.courses!.length,
                itemBuilder: ((context, index) {
                  return CustomListTile(
                    index: index,
                    title: newMuslimsController
                        .newMuslimsModel.courses![index].title!,
                    onTap: () {
                      Get.to(() => NewMuslimsCourseScreen(index: index));
                    },
                  );
                }),
              ),
      ),
    );
  }
}
