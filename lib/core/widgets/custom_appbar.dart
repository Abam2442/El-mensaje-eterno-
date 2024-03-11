import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../styles/text_styles.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({required this.title, super.key});
final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.kPrimaryColor,
      title: Center(child: Text(title,style: Styles.textStyle18Godlen,),),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
