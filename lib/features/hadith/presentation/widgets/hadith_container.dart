import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/hadith_arabic_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/services/easy_loader_service.dart';
import '../../../../core/styles/text_styles.dart';

class HadithContainer extends StatelessWidget {
  final List<String> hadith;

  const HadithContainer({required this.hadith, super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        HadithArabicContainer(hadithArabic: hadith[0]),
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
                  hadith[1],
                  style: Styles.textStyle18Black,
                  textDirection: TextDirection.ltr,
                ),
              ),
              InkWell(
                onTap: () async {
                  var data = ClipboardData(text: hadith[1]);
                  await Clipboard.setData(data);
                  EasyLoaderService.showToast(message: "Copied");
                },
                child: SvgPicture.asset(
                  AppAssets.kCopyIcon,
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
