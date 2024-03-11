import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/data/models/azkar_model/zikr.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/presentation/controller/azkar_doaa_controller.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/presentation/widgets/hadith_arabic_container.dart';

import '../../../../core/services/easy_loader_service.dart';

class BodyContentAzkarScreen extends GetView<AzkarDoaaController> {
  const BodyContentAzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<ZikrModel> azkar = Get.arguments["data"];
    return PopScope(
      onPopInvoked: (didPop) {
        controller.currentPage.value = 0;
      },
      child: SliverToBoxAdapter(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 12),
              SizedBox(
                height: Get.height * 0.6,
                child: PageView.builder(
                  controller: controller.pageController,
                  itemCount: azkar.length,
                  onPageChanged: controller.onPageChanged,
                  itemBuilder: (context, index) {
                    ZikrModel zikr = azkar[index];
                    return SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.transparent,
                              backgroundImage: const AssetImage(AppAssets.kZaghrafaIcon),
                              child: Text(
                                (index + 1).toString(),
                                style: Styles.textStyle14Golden,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            HadithArabicContainer(
                              hadithArabic: zikr.arabic ?? "",
                            ),
                            const SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(left: 12),
                                    constraints: BoxConstraints(
                                      maxWidth: MediaQuery.sizeOf(context).width - 70,
                                    ),
                                    child: Text(
                                      zikr.espaniol ?? "",
                                      style: Styles.textStyle18Black,
                                      textDirection: TextDirection.ltr,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      var data = ClipboardData(text: zikr.espaniol ?? "");
                                      await Clipboard.setData(data);
                                      EasyLoaderService.showToast(message: "Copied");
                                    },
                                    child: SvgPicture.asset(
                                      AppAssets.kCopyIcon,
                                    ),
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
              SizedBox(height: 80.h),
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
                        '${azkar[controller.currentPage.value].repeatNumber.toString()} / ',
                        style: const TextStyle(color: AppColors.black),
                      ),
                    ),
                    const Text(
                      "1",
                      style: TextStyle(color: AppColors.white),
                    ),
                    const Icon(Icons.repeat, color: AppColors.black),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
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
                          azkar.length.toString(),
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
                    () => controller.goToNextPage(azkar),
                  ),
                ],
              ),
            ],
          ),
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
        child: Icon(
          icon,
          color: AppColors.kGoldenColor,
        ),
      ),
    );
  }
}
