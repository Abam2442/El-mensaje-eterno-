import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/surah_screen_widgets/aya_text.dart';

class AyaLanguageContainer extends StatelessWidget {
  final String ayaNonArabic;
  final int ayaNumber;
  final String mafsir;

  const AyaLanguageContainer(
      {required this.ayaNonArabic,
      required this.ayaNumber,
      super.key,
      required this.mafsir});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            // padding: const EdgeInsets.only(left: 12),
            constraints:
                BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width - 50),
            child: AyaText(
                aya: ayaNonArabic,
                ayaStyle: Styles.textStyle18Black,
                ayaNumber: ayaNumber,
                textDirection: TextDirection.ltr,
                ayaNumberStyle: Styles.textStyleQuranPageNumber
                    .copyWith(color: AppColors.kGreenColor)),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(
                mafsir,
                style: Styles.textStyle14primary,
              )),
              InkWell(
                  onTap: () async {
                    var data = ClipboardData(text: ayaNonArabic);
                    await Clipboard.setData(data);
                    //
                  },
                  child: const Icon(Icons.copy)),
            ],
          ),
        ],
      ),
    );
  }
}
