import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/utils/components/appbar/build_sliver_appbar.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/quran_controller.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/aya_container.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/basmala_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/multicopy_aya_container.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/telawa_widget.dart';

class SurahScreen extends StatelessWidget {
  const SurahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        bottomSheet: BottomSheet(
          builder: (context) {
            return TelawaWidget(
              chapterNumber: 1,
            );
          },
          constraints: BoxConstraints(
            maxHeight: size.height * 0.19,
            minHeight: size.height * 0.18,
          ),
          backgroundColor: AppColors.kLightGreenColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(22.0)),
          ),
          onClosing: () {},
        ),
        body: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                controller: Get.find<QuranController>().scrollController,
                slivers: [
                  const SliverAppBarWidget(
                    isSearch: false,
                    backgroundColor: AppColors.kWhiteColor,
                    iconColor: AppColors.kPrimaryColor,
                  ),
                  const SliverToBoxAdapter(
                    child: Column(
                      children: [
                        BasmalaImage(),
                        SizedBox(height: 12),
                      ],
                    ),
                  ),
                  GetBuilder<QuranController>(builder: (controller) {
                    return SliverList.builder(
                      itemCount: controller.currentAyat.length,
                      itemBuilder: (context, index) {
                        return controller.isMultiCopyEnabled
                            ? MultiCopyAyaContainer(
                                number: index + 1,
                                ayah: controller.currentAyat[index],
                              )
                            : AyaContainer(
                                number: index + 1,
                                ayah: controller.currentAyat[index],
                              );
                      },
                    );
                  }),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 150,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: .1),
          ],
        ),
      ),
    );
  }
}
