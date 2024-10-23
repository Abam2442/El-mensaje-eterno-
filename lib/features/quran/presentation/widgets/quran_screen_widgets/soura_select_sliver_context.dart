import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/features/quran/domain/entities/surah_entity.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/quran_controller.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/quran_screen_widgets/handle_states_widget.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/quran_screen_widgets/primary_shimmer.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/quran_screen_widgets/soura_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SurahSelectSliver extends StatelessWidget {
  final List<Surah> surahs;

  const SurahSelectSliver({
    required this.surahs,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GetBuilder<QuranController>(
        builder: (controller) => SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Color(0xFFbac2b9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: HandleStatesWidget(
                  stateType: controller.getSurahsState,
                  hasShimmer: true,
                  shimmerChild: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => PrimaryShimmer.rectangle(
                      height: Get.height * 0.09,
                      color: AppColors.kPrimaryColor,
                      border: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 15,
                    ),
                    itemCount: 8,
                  ),
                  child: Column(children: [
                    const SizedBox(
                      height: 10,
                    ),
                    ...List.generate(
                      controller.surahs.length,
                      (index) => SouraItem(
                        souraNumber: index + 1,
                        souraName: controller.surahs[index].name,
                        isSaved: false,
                      ),
                    ),
                  ]),
                ),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
