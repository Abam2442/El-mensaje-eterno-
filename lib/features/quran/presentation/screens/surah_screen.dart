import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/utils/components/appbar/build_sliver_appbar.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/quran_controller.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/aya_container.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/basmala_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SurahScreen extends StatelessWidget {
  const SurahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                const SliverAppBarWidget(
                  isSearch: false,
                  backgroundColor: AppColors.kWhiteColor,
                  iconColor: AppColors.kPrimaryColor,
                  hasTranslator: true,
                ),
                SliverToBoxAdapter(
                  child: SingleChildScrollView(
                    child: GetBuilder<QuranController>(
                      builder: (controller) => Column(
                        children: [
                          const BasmalaImage(),
                          const SizedBox(height: 12),
                          ...List.generate(
                            controller.currentAyat.length,
                            (index) => AyaContainer(
                              number: index + 1,
                              ayah: controller.currentAyat[index],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: .1),
          // const TelawaWidget(),
        ],
      ),
    );
  }
}
