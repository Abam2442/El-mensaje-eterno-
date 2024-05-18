import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/data/models/azkar_model/zikr.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/presentation/controller/azkar_doaa_controller.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/presentation/widgets/hadith_arabic_container.dart';
import 'package:hiwayda_oracion_islamica/features/kids/controller/kids_controller.dart';
import 'package:hiwayda_oracion_islamica/features/kids/view/question_answer_widget.dart';

import '../../../../core/services/easy_loader_service.dart';
import '../model/kids_model.dart';

class BodyContentKidsScreen extends GetView<KidsController> {
  final int indexLessons;
  const BodyContentKidsScreen(this.indexLessons,   {super.key});

  @override
  Widget build(BuildContext context) {
    print(indexLessons);
 Lessons? KidsLesson =   controller.kidsModel.value.lessons?[indexLessons];
   print(controller.LessonIndex.value);

    return  PopScope(
        onPopInvoked: (didPop) {
      controller.currentPage.value = 0;
    },
    child:SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          SizedBox(
            height: Get.height * 0.8, //0.65,
            child: PageView.builder(
              controller: controller.pageController,
              itemCount:KidsLesson?.content?.length,// kidsModel.length,
              onPageChanged: controller.onPageChanged,
              itemBuilder: (context, index) {
               // KidsModel kids = kidsModel[index];
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        CircleAvatar(
                          backgroundColor: AppColors.transparent,
                          radius: 30.sp,
                          backgroundImage:
                          const AssetImage(AppAssets.kZaghrafaIcon),
                          child: Text(
                            (" P ${index + 1} "),
                            style: Styles.textStyle14Golden,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        QuestionAnswerContainer(
                         Question_Answer: KidsLesson?.content![index].question?? "",
                        ),
                        const SizedBox(height: 12),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          padding: const EdgeInsets.all(10),
                            width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.kGreenColor,
                          ),
                          alignment: Alignment.center,
                                                     //   padding: const EdgeInsets.only(left: 12),
                          constraints: BoxConstraints(
                            maxWidth:
                            MediaQuery.sizeOf(context).width - 50,
                          ),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment :Alignment.centerRight,
                                child: InkWell(
                                  onTap: () async {
                                    var data = ClipboardData(
                                        text:  KidsLesson?.content![index].answer?? "");// kids.lessons![index].content![index].question?? "",);
                                    await Clipboard.setData(data);
                                    EasyLoaderService.showToast(
                                        message: "Copied");
                                  },
                                  child: SvgPicture.asset(
                                    AppAssets.kCopyIcon,
                                  ),
                                ),
                              ),
                              SelectableText(
                                KidsLesson?.content![index].answer?? "",//  kids.lessons![index].content![index].answer?? "",
                                style: Styles.textStyle18Black,
                                textDirection: TextDirection.ltr,
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              navigateToPage(
                Icons.arrow_back_ios,
                controller.goToPreviousPage,
              ),
              SizedBox(width: 10.w),
              Container(
                padding: EdgeInsets.all(10.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.sp),
                  color: AppColors.kGreenColor,
                ),
                child: Row(
                  children: [
                    Text(
                      KidsLesson?.content?.length.toString() ?? "",
                      style: TextStyle(
                        color: AppColors.kGoldenColor,
                        fontSize: 20.sp,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'of',
                      style: TextStyle(
                        fontSize: 20.sp,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Obx(
                          () => Text(
                        (controller.currentPage.value + 1).toString(),
                        style: TextStyle(
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              navigateToPage(
                Icons.arrow_forward_ios,
                    () => controller.goToNextPage( KidsLesson?.content),
              ),
            ],
          ),

        ],
      ),
    )
    );
  }

  GestureDetector navigateToPage(IconData icon, Function() controllerFunction) {
    return GestureDetector(
      onTap: controllerFunction,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.sp),
          color: AppColors.kGreenColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            color: AppColors.kGoldenColor,
          ),
        ),
      ),
    );
  }
}
