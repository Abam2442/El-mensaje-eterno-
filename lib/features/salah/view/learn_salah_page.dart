import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_svgs.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/context_size.dart';
import 'package:hiwayda_oracion_islamica/features/salah/model/tahara_lesson_model.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/widgets/options.dart';


class LearnSalahPage extends StatelessWidget {
  const LearnSalahPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          tag: 'salah',
                          child: Options(
                            label: 'Learn Salah',
                            image: AppSvgs.salahrokoa,
                            onTap: () {},
                          ),
                        ),
                      ),
                      20.hSize,
                      SizedBox(
                        height: context.height * 0.5,
                        child: FutureBuilder<List<TaharaLessonModel>>(
                          future: TaharaLessonFromJson.getData(),
                          builder: (context, snapshot) {
                            final taharaLessons = snapshot.data;
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              default:
                                if (snapshot.hasError) {
                                  print('snapshot.error ${snapshot.error}');
                                  return Center(
                                    child: Text('Some error occurred ${snapshot.error}'),
                                  );
                                } else {
                                  return buildLessons(taharaLessons!);
                                }
                            }
                          },
                        ),
                      )
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
        final lesson = lessons[index];
        return ListTile(
          leading: Text(
            '${index + 1}',
            style: AppTextColors.textStyle,
          ),
          title: Text(lesson.title, style: AppTextColors.textStyle),
          onTap: () {
            //Get.to(LessonsDetailsPage(lesson.lessonDetail,lesson.title));
          },
          trailing: const Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.white,
          ),
        );
      });
}
