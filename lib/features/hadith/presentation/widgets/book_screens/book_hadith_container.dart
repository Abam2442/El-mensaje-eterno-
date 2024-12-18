import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/services/easy_loader_service.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/hadith_arabic_container.dart';

class BookHadithContainer extends StatelessWidget {
  final Map<String, dynamic> hadith;

  const BookHadithContainer({required this.hadith, super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 12),
        hadith['ar'] == null
            ? const SizedBox()
            : HadithArabicContainer(hadithArabic: hadith['ar']),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 12),
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width - 70),
                child: Text(
                  hadith['es'],
                  style: Styles.textStyle18Black,
                  textDirection: TextDirection.ltr,
                ),
              ),
              InkWell(
                onTap: () async {
                  var data = ClipboardData(text: hadith['es']);
                  await Clipboard.setData(data);
                  EasyLoaderService.showToast(message: "Copied");
                },
                child: SvgPicture.asset(
                  AppAssets.kCopyIcon,
                  color: AppColors.kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
