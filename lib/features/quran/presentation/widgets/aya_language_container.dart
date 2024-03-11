import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/services/easy_loader_service.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/quran_controller.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/aya_text.dart';

class AyaLanguageContainer extends StatelessWidget {
  final String ayaNonArabic;
  final int ayaNumber;

  const AyaLanguageContainer({required this.ayaNonArabic, required this.ayaNumber, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 12),
            constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width - 50),
            child: AyaText(
                aya: ayaNonArabic,
                ayaStyle: Styles.textStyle18Black,
                ayaNumber: ayaNumber,
                textDirection: TextDirection.ltr,
                ayaNumberStyle: Styles.textStyleQuranPageNumber.copyWith(color: AppColors.kGreenColor)),
          ),
          InkWell(
            onTap: () async {
              var c = Get.find<QuranController>();
              var data = ClipboardData(text: ayaNonArabic);
              await Clipboard.setData(data);
              EasyLoaderService.showToast(message: "Copied");
            },
            child: SvgPicture.asset(
              AppAssets.kCopyIcon,
            ),
          ),
        ],
      ),
    );
  }
}
