import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_pages_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/player_widget.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/translator_diallog.dart';

import '../controller/quran_controller.dart';
import '../controller/telawa_controller.dart';

class TelawaWidget extends StatelessWidget {
  final int chapterNumber;

  TelawaWidget({required this.chapterNumber, super.key});

  final telawaController = Get.put(TelawaController());
  final QuranController quranController = Get.find<QuranController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(22.0)),
          color: AppColors.kLightGreenColor),
      child: Column(children: [
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () => Get.toNamed(AppPagesRoutes.telawaScreen),
                child: Row(
                  children: [
                    GetBuilder<TelawaController>(builder: (controller) {
                      return Expanded(
                        child: Text(
                          controller.selectedReader.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: AppColors.kGoldenColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }),
                    const Icon(
                      Icons.keyboard_arrow_up,
                      color: AppColors.kGoldenColor,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                quranController.updateMultiCopyState();
              },
              icon: const Icon(
                Icons.copy,
                size: 18,
                color: AppColors.kBlueColor,
              ),
            ),
            IconButton(
              onPressed: () {
                //todo edit this dialog add check box and translates to it
                //and remove translator from app bar
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const TranslatorDialog();
                  },
                );
              },
              icon: const Icon(
                Icons.translate,
                size: 18,
                color: AppColors.kBlueColor,
              ),
            ),
          ],
        ),
        PlayerWidget(
          chapterNumber: chapterNumber,
        ),
      ]),
    );
  }
}