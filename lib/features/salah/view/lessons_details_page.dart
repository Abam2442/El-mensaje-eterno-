import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/features/salah/data/model/tahara_lesson_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/lesson_details_page.dart';

import '../../../../core/styles/text_styles.dart';

class LessonsDetailsPage extends StatelessWidget {
  LessonsDetailsPage(
      {super.key,
      required this.list,
      this.list2,
      required this.title,
      required this.icon});
  String icon;
  String title;
  List<LessonDetail> list;
  List<LessonDetail>? list2;
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
                        height: context.height * 0.1,
                        child: Hero(tag: title, child: SvgPicture.asset(icon)),
                      ),
                      SizedBox(
                        height: context.height * 0.05,
                        child: Text(title, style: Styles.textStyle20Golden),
                      ),
                      5.hSize,
                      Container(
                          decoration: const BoxDecoration(
                              color: AppColors.kWhiteColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          height: context.height * 0.7,
                          child: _defaultListView(list)),
                      if (list2 != null)
                        SizedBox(
                          height: context.height * 0.05,
                          child: Text(title, style: Styles.textStyle20Golden),
                        ),
                      if (list2 != null) 5.hSize,
                      /*if(list2 !=null)
                        SizedBox(
                            height: context.height*0.7,
                            child: _secondListView(list2!)
                        ),*/
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  ListView _defaultListView(List<LessonDetail> l) {
    print('list len: ${l.length}');
    return ListView.builder(
        key: key,
        itemCount: l.length,
        itemBuilder: (BuildContext context, int position) =>
            _buildCard(context, position));
  }

  ListView _secondListView(List<LessonDetail> l) {
    print('list len: ${l.length}');
    return ListView.builder(
        itemCount: l.length,
        itemBuilder: (BuildContext context, int position) =>
            _buildCard(context, position));
  }

  Widget _buildCard(BuildContext context, int position) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      ),
      direction: DismissDirection.endToStart,
      child: Card(
          color: AppColors.kGreenColor,
          elevation: 2.0,
          child: ListTile(
            onTap: () {
              Get.to(LessonDetailsPage(
                lessonDetail: list[position],
              ));
            },
            title: Text(
              list[position].title,
              style: Styles.textStyle18Golden,
            ),
            trailing: FittedBox(
              fit: BoxFit.fill,
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  child: const Icon(Icons.arrow_forward_ios_outlined,
                      color: AppColors.kGoldenColor),
                ),
              ]),
            ),
          )),
    );
  }
}
