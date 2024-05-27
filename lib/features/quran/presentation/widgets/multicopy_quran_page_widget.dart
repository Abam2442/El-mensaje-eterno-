import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/quran/domain/entities/ayah_entity.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/quran_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MultiCopyQuranPageWidget extends StatelessWidget {
  final int number;
  final Ayah ayah;

  const MultiCopyQuranPageWidget({
    required this.number,
    required this.ayah,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 26,
          decoration: const BoxDecoration(
            color: AppColors.kGoldenColor,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(90)),
          ),
          child: Center(
            child: Text(
              number.toString(),
              style: Styles.textStyleQuranPageNumber,
            ),
          ),
          // Add child widgets here if needed
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: SizedBox(
            width: 30,
            height: 30,
            child: GetBuilder<QuranController>(builder: (c) {
              return Checkbox(
                fillColor: MaterialStateProperty.all(AppColors.kWhiteColor),
                value: c.multiCopySelectedAyat.contains(
                    "${ayah.arabic}\n\n${c.selectedTranslator == 1 ? ayah.julioCortes : c.selectedTranslator == 2 ? ayah.raulGonzalezBornez : ayah.muhammadIsaGarcia}"),
                onChanged: (value) {
                  c.updateMultiCopySelection(
                      "${ayah.arabic}\n\n${c.selectedTranslator == 1 ? ayah.julioCortes : c.selectedTranslator == 2 ? ayah.raulGonzalezBornez : ayah.muhammadIsaGarcia}");
                },
                activeColor: AppColors.kBlackColor,
                checkColor: AppColors.kGreenColor,
              );
            }),
          ),
        ),
      ],
    );
  }
/*InkWell(
            onTap: () async {
              var c = Get.find<QuranController>();
              var data = ClipboardData(
                  text:
                      ");
              await Clipboard.setData(data);
              EasyLoaderService.showToast(message: "Copied");
            },
            child: SvgPicture.asset(
              AppAssets.kCopyIcon,
            ),
          )*/
}