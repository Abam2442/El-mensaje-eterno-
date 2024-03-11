
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../views/pages/LearnSalah/salah_importance_page.dart';
import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.kPrimaryColor,
      title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SvgPicture.asset(AppAssets.logoApp)),
      actions: const [
        CustomPopupMenuButton(),
      ],
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
      },
      itemBuilder: (BuildContext context) => [
        _buildPopupMenuItem('Language', FontAwesomeIcons.language, 'Language'),
        _buildPopupMenuItem(
            'Report a problem', FontAwesomeIcons.info, 'Report a Problem'),
        _buildPopupMenuItem('Theme', FontAwesomeIcons.paintbrush, 'Theme'),
        _buildPopupMenuItem('Country', FontAwesomeIcons.globe, 'Country'),
        _buildPopupMenuItem('About the developers', FontAwesomeIcons.user,
            'About the Developers'),
      ],
      splashRadius: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      offset: const Offset(200, 60),
      elevation: 0,
      color: AppColors.kGreenColor,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(AppAssets.menuIcon),
          ),
          IconButton(onPressed: (){
            Get.to(()=>SalahImportancePage());
          }, icon: const Icon(Icons.info_outline,color: AppColors.kGoldenColor,))
        ],
      )


    );
  }

  _buildPopupMenuItem(String value, IconData icon, String text) {
    return PopupMenuItem<String>(
      value: value,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 20,
            child: Center(
              child: FaIcon(
                icon,
                color: AppColors.kWhiteColor,
              ),
            ),
          ),
          const SizedBox(width: 25),
          Text(text),
        ],
      ),
    );
  }
}
