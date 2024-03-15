import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/about/about_binding.dart';
import 'package:hiwayda_oracion_islamica/features/about/view/about_screen.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/copy_right_page.dart';

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
      title: Padding(padding: const EdgeInsets.symmetric(horizontal: 12), child: SvgPicture.asset(AppAssets.logoApp)),
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
      onSelected: (value) {},
      itemBuilder: (BuildContext context) => [
        _buildPopupMenuItem('Fuentes', FontAwesomeIcons.copyright, 'Fuentes', () {
          Get.to(() => const CopyRightPage());
        }),
        _buildPopupMenuItem('Developers', FontAwesomeIcons.user, 'Developers', () {
          Get.to(() => const AboutScreen(), binding: AboutBinding());
        }),
      ],
      splashRadius: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      offset: const Offset(0, 30),
      elevation: 0,
      color: AppColors.kGreenColor,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Transform.flip(
          flipX: true,
          child: SvgPicture.asset(AppAssets.menuIcon),
        ),
      ),
    );
  }

  _buildPopupMenuItem(String value, IconData icon, String text, VoidCallback? onTap) {
    return PopupMenuItem<String>(
      onTap: onTap,
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
