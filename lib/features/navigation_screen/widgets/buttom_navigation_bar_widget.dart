import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/features/navigation_screen/controller/navigation_controller.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = NavigationController.instance;
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(color: Colors.black, offset: Offset(5, 5), blurRadius: 8),
        ],
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TabBar(
        dividerHeight: 0,
        dividerColor: Colors.transparent,
        labelStyle: TextStyle(
          fontSize: 12.sp,
          color: AppColors.kGoldenColor,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12.sp,
          color: AppColors.kWhiteColor,
        ),
        tabs: [
          ...List.generate(
            controller.tabBarData.length,
            (int index) => Tab(
              text: controller.tabBarData[index].text,
              icon: SvgPicture.asset(
                controller.tabBarData[index].image,
                width: 23,
              ),
              iconMargin: const EdgeInsets.only(bottom: 5),
            ),
          )
        ],
        controller: controller.tabController,
      ),
    );
  }
}
