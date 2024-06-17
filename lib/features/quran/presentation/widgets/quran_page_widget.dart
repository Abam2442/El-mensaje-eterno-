import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/services/easy_loader_service.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/quran/domain/entities/ayah_entity.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/quran_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/surrah_controller.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/aya_text.dart';

class QuranPageWidget extends StatelessWidget {
  final int number;
  final Ayah ayah;

  QuranPageWidget({
    required this.number,
    required this.ayah,
    super.key,
  });

  final surrahController = Get.find<SurahController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          color: surrahController.currentRandomVerse.value == number
              ? Color.fromARGB(255, 193, 188, 188)
              : surrahController.currentVerse.value == number
                  ? AppColors.kGreenColor
                  : const Color.fromARGB(255, 134, 131, 131),
          padding: EdgeInsets.symmetric(vertical:  4 , horizontal: 8),
          child: Row(
            children: [
              Container(
                width: 26,
                height: 26,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(Radius.circular(90)),
                ),
                child: Center(
                  child: Text(
                    number.toString(),
                    style: Styles.textStyleQuranPageNumber,
                  ),
                ),
                // Add child widgets here if needed
              ),
              const SizedBox(
                width: 8,
              ),
              IconButton(
                  onPressed: () {
                    surrahController.readVerse(number);
                  },
                  icon: const Icon(
                    Icons.volume_up_outlined,
                    color: AppColors.white,
                    size: 26,
                  )),
              const Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: surrahController.isCopyingAyas.value ?
                  Obx(() =>    Checkbox(value: surrahController.selectedAyas.contains(ayah), onChanged: (value){
                    if(value == true) {
                      surrahController.selectedAyas.add(ayah);
                    }
                    else
                    {
                      surrahController.selectedAyas.remove(ayah);
                    }
                   }, activeColor: Colors.black, fillColor: MaterialStateColor.resolveWith((states) => AppColors.kWhiteColor) ,checkColor: Colors.black,))
                 : InkWell(
                  onTap: () async {
                    var data = ClipboardData(
                        text: surrahController.getAyaCopyText(ayah));
                    await Clipboard.setData(data);
                    EasyLoaderService.showToast(message: "Copied");
                  },
                  child: SvgPicture.asset(
                    AppAssets.kCopyIcon,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
