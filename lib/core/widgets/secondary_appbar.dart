import '../constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SecondaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const SecondaryAppBar({
    super.key,
    required this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: AppColors.gray
          ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(Get.width, 50.h);
}
