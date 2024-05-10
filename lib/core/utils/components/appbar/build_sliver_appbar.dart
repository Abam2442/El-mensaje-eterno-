import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/primary_select_item.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/quran_controller.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../styles/text_styles.dart';
import 'direction_aware.dart';

class SliverAppBarWidget extends StatelessWidget {
  final bool? isSearch;
  final Color backgroundColor;
  final Color iconColor;
  final bool isPinned;
  final String title;
  final bool hasTranslator;

  const SliverAppBarWidget({
    super.key,
    this.isSearch,
    this.backgroundColor = AppColors.kPrimaryColor,
    this.iconColor = AppColors.kWhiteColor,
    this.title = '',
    this.isPinned = false,
    this.hasTranslator = false,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      leading: !Navigator.canPop(context)
          ? null
          : DirectionAware(
              // من شان تدوير الايقونة بزاوية 90
              //DirectionAware for rotate the icon to other side rtl or ltr
              child: IconButton(
                onPressed: () => Get.back(),
                icon: SvgPicture.asset(
                  AppAssets.kBackIcon,
                  // color: iconColor,
                ),
              ),
            ),
      centerTitle: true,
      title: Text(
        title,
        style: Styles.textStyle18Godlen,
      ),
      actions: [
        // isSearch == true
        //     ? Padding(
        //         padding: const EdgeInsets.only(right: 20),
        //         child: SvgPicture.asset(
        //           AppAssets.kSearchIcon,
        //           color: iconColor,
        //         ),
        //       )
        //     : const SizedBox(),
        if (hasTranslator)
          SizedBox(
            width: 0.5 * Get.width,
            child: GetBuilder<QuranController>(
              id: "Translator Select",
              builder: (controller) => PrimarySelectItem<int>(
                labelText: "Translator",
                hintText: "Select",
                onChanged: (value) {
                  controller.selectedTranslator = value ?? controller.selectedTranslator;
                  controller.update(["Translator Select", "ayaNonArabic"]);
                },
                items: const [
                  DropdownMenuItem<int>(
                    value: 1,
                    child: Text('Translator 1'),
                  ),
                  DropdownMenuItem<int>(
                    value: 2,
                    child: Text('Translator 2'),
                  ),
                  DropdownMenuItem<int>(
                    value: 3,
                    child: Text('Translator 3'),
                  ),
                ],
                selectedItem: controller.selectedTranslator,
              ),
            ),
          ),
      ],
      floating: true,
      snap: true,
      elevation: 0,
      pinned: isPinned,
    );
  }
}
