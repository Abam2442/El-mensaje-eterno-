import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/services/easy_loader_service.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/controller/hadith_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HadithSearchScreen extends GetView<HadithController> {
  const HadithSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HadithController>();
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: controller.searchResultArabic.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                        var data = ClipboardData(
                            text: controller.searchResultArabic[index]);
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
                          controller.searchResultArabic[index],
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
                        controller.searchResultEs[index],
                        style: Styles.textStyle18Black,
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        var data = ClipboardData(
                          text: controller.searchResultEs[index],
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
            ],
          );
        },
      ),
    );
  }
}
