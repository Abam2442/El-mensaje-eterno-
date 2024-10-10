import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/services/easy_loader_service.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HadithSearchScreen extends StatelessWidget {
  final String arabicSearch, esSearch;
  const HadithSearchScreen(
      {super.key, required this.arabicSearch, required this.esSearch});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.kGreenColor,
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () async {
                  var data = ClipboardData(text: arabicSearch);
                  await Clipboard.setData(data);
                  EasyLoaderService.showToast(message: "Copied");
                },
                child: SvgPicture.asset(
                  AppAssets.kCopyIcon,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: context.width * 0.7,
                child: Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.sizeOf(context).width - 50),
                  child: Text(
                    arabicSearch,
                    style: Styles.textStyle18Godlen,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ],
          ),
        ),
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
                  esSearch,
                  style: Styles.textStyle18Black,
                  textDirection: TextDirection.ltr,
                ),
              ),
              InkWell(
                onTap: () async {
                  var data = ClipboardData(
                    text: esSearch,
                  );
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
        const SizedBox(
          height: 100,
        )
      ],
    );
  }
}
