import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/services/easy_loader_service.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/hadith_arabic_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SunnahHadithContainer extends StatelessWidget {
  final String hadith, explain;

  const SunnahHadithContainer(
      {required this.hadith, super.key, required this.explain});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        HadithArabicContainer(hadithArabic: hadith),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 12),
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width - 70),
              child: Text(
                explain,
                style: Styles.textStyle18Black,
                textDirection: TextDirection.ltr,
              ),
            ),
            InkWell(
              onTap: () async {
                var data = ClipboardData(text: explain);
                await Clipboard.setData(data);
                EasyLoaderService.showToast(message: "Copied");
              },
              child: SvgPicture.asset(
                AppAssets.kCopyIcon,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
