import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/custom_listTile.dart';
import 'package:hiwayda_oracion_islamica/features/kids/controller/kids_controller.dart';
import 'package:hiwayda_oracion_islamica/features/kids/view/kids_lesson_screen.dart';

class KidsCourseScreen extends StatelessWidget {
  KidsCourseScreen({
    super.key,
    //  required this.index
  });

  // final int index;
  KidsController kidsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Padding(
        padding: 10.aEdge,
        child: ListView.builder(
            itemCount: kidsController.kidsModel.titles!.length,
            itemBuilder: (context, i) => CustomListTile(
                  index: i,
                  title: kidsController.kidsModel.titles![i].title!,
                  onTap: () {
                    Get.to(
                        () => KidsLessonScreen(courseIndex: i, lessonIndex: i));
                  },
                )),
      ),
    );
  }
}
