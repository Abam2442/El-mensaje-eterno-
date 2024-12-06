import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/features/about/about_binding.dart';
import 'package:hiwayda_oracion_islamica/features/about/view/about_screen.dart';
import 'package:hiwayda_oracion_islamica/features/download_screen/download_screen.dart';
import 'package:hiwayda_oracion_islamica/features/question/question_screen.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/copy_right_page.dart';
import 'package:hiwayda_oracion_islamica/features/search/search_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.kPrimaryColor,
      title: GestureDetector(
        onTap: () {
          launchUrl(Uri.parse(
              'https://play.google.com/store/apps/details?id=com.mensaje.eterno'));
        },
        child: SvgPicture.asset(
          AppAssets.logoApp,
          height: 50,
        ),
      ),
      actions: [
        const CustomPopupMenuButton(),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () => Get.to(() => const SearchScreen()),
        ),
        IconButton(
          icon: const Icon(Icons.download),
          onPressed: () => Get.to(() => const DownloadScreen()),
        )
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
      iconColor: Colors.black,
      onSelected: (value) {},
      itemBuilder: (BuildContext context) => [
        _buildPopupMenuItem('Guía para usar la aplicación.',
            FontAwesomeIcons.copyright, 'Guía para usar la aplicación.', () {
          Get.to(() => const CopyRightPage());
        }),
        _buildPopupMenuItem('Developers', FontAwesomeIcons.user, 'Developers',
            () {
          Get.to(() => const AboutScreen(), binding: AboutBinding());
        }),
        _buildPopupMenuItem('Para consultas y sugerencias',
            FontAwesomeIcons.question, 'Para consultas y sugerencias', () {
          Get.to(() => const QuestionScreen());
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
          child: SvgPicture.asset(
            AppAssets.menuIcon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  _buildPopupMenuItem(
      String value, IconData icon, String text, VoidCallback? onTap) {
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
