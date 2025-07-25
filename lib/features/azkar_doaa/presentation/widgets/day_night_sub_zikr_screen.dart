import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/presentation/controller/azkar_doaa_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/app_bar_custom.dart';

import '../../../../core/services/easy_loader_service.dart';
import '../../data/models/sonan_model.dart';

class BodySonanDayNightSubZikrScreen extends GetView<AzkarDoaaController> {
  final DayAndNightSonan dayAndNightSonan;
  const BodySonanDayNightSubZikrScreen(
      {super.key, required this.dayAndNightSonan});

  @override
  Widget build(BuildContext context) {
    // List<SingleDoaa> doaas = Get.arguments['data'];
    return PopScope(
      onPopInvoked: (didPop) {
        controller.currentPage.value = 0;
      },
      child: Scaffold(
        appBar:
            AppBarCustom(title: dayAndNightSonan.title).customAppBar(context),
        body: Column(
          children: [
            const SizedBox(height: 12),
            SizedBox(
              height: Get.height * 0.65,
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: dayAndNightSonan.azkar.length,
                onPageChanged: controller.onPageChanged,
                itemBuilder: (context, index) {
                  var doaa = dayAndNightSonan.azkar[index];
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.transparent,
                          backgroundImage:
                              const AssetImage(AppAssets.kZaghrafaIcon),
                          child: Text(
                            (index + 1).toString(),
                            style: Styles.textStyle14Golden,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //     horizontal: 13,
                        //     vertical: 8,
                        //   ),
                        //   child: Text(
                        //     doaa.zikr,
                        //     style: Styles.textStyle18Godlen,
                        //   ),
                        // ),
                        // const SizedBox(height: 12),
                        Column(
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              padding: const EdgeInsets.all(10),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColors.kGreenColor,
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 270.w,
                                    child: Container(
                                      constraints: BoxConstraints(
                                          maxWidth:
                                              MediaQuery.sizeOf(context).width -
                                                  50),
                                      child: Text(
                                        doaa.zikr,
                                        style: Styles.textStyle18Godlen,
                                        textDirection: TextDirection.ltr,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      var data = ClipboardData(text: doaa.zikr);
                                      await Clipboard.setData(data);
                                      EasyLoaderService.showToast(
                                          message: "Copied");
                                    },
                                    child: SvgPicture.asset(
                                      AppAssets.kCopyIcon,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              width: Get.width,
              height: 50.sp,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: AppColors.kGoldenColor,
                borderRadius: BorderRadius.circular(15.sp),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => Text(
                      '${dayAndNightSonan.azkar[controller.currentPage.value].noOfTimes.toString()}  ',
                      style:
                          const TextStyle(color: AppColors.black, fontSize: 16),
                    ),
                  ),
                  const Text(
                    "times to repeat",
                    style: TextStyle(color: AppColors.black, fontSize: 16),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  // const Icon(Icons.repeat, color: AppColors.black),
                ],
              ),
            ),
            SizedBox(height: 8.h),
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
                        dayAndNightSonan.azkar.length.toString(),
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
                  () => controller.goToNextPage(dayAndNightSonan.azkar),
                ),
              ],
            ),
          ],
        ),
      ),
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
