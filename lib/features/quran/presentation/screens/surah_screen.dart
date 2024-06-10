// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/utils/components/appbar/build_sliver_appbar.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/quran_controller.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/aya_container.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/multicopy_aya_container.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/telawa_widget.dart';

class SurahScreen extends StatefulWidget {
  final int targetNumber;
  const SurahScreen({
    Key? key,
    this.targetNumber = 0,
  }) : super(key: key);

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback(_scrollToTargetAyah);
  }

  void _scrollToTargetAyah(_) {
    if (widget.targetNumber != -1) {
      _scrollController.animateTo(
        widget.targetNumber * 150, // Assuming each Ayah item height is 56.0
        duration: 1.seconds,
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
                controller: _scrollController,
                slivers: [
                  const SliverAppBarWidget(
                    isSearch: false,
                    backgroundColor: AppColors.kWhiteColor,
                    iconColor: AppColors.kPrimaryColor,
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
