import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/services/easy_loader_service.dart';
import '../../../../core/styles/text_styles.dart';

class HadithArabicContainer extends StatelessWidget {
  final String hadithArabic;
  const HadithArabicContainer({
    required this.hadithArabic,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width * 0.04),
      padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.02),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.kPrimaryColor,
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () async {
              var data = ClipboardData(text: hadithArabic);
              await Clipboard.setData(data);
              EasyLoaderService.showToast(message: "Copied");
            },
            child: SvgPicture.asset(
              AppAssets.kCopyIcon,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.8,
            child: Container(
              // padding: const EdgeInsets.only(right: 12),
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width - 50),
              child: Text(
                hadithArabic,
                style: Styles.textStyle18Godlen,
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
        ],
      ),

      // AyaText(aya: hadithArabic, ayaNumber: 1),
    );
  }
}
