import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_svgs.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/features/salah/data/model/tahara_lesson_model.dart';
import 'package:hiwayda_oracion_islamica/features/salah/salah_controller.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/lessons_details_page.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/widgets/options.dart';

class OtherLessonsPage extends StatelessWidget {
  const OtherLessonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SalahController controller = SalahController.instance;
    return Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: 16.aEdge,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: context.height * 0.2,
                        child: Hero(
                          tag: AppSvgs.otherLessons,
                          child: Options(
                            label: 'Other Lessons',
                            image: AppSvgs.otherLessons,
                            onTap: () {},
                          ),
                        ),
                      ),
                      20.hSize,
                      buildLessons(controller.lessonTahara)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget buildLessons(List<TaharaLessonModel> lessons) => ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: lessons.length,
      itemBuilder: (context, index) {
        if (index > 1) {
          final lesson = lessons[index];
          return ListTile(
            leading: Text(
              '${index - 1}',
              style: AppTextColors.textStyle,
            ),
            title: Text(lesson.title, style: AppTextColors.textStyle),
            onTap: () {
              Get.to(LessonsDetailsPage(
                list: lesson.lessonDetail,
                title: lesson.title,
                icon: AppSvgs.otherLessons,
              ));
            },
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white,
            ),
          );
        } else {
          return Container();
        }
      });
}
