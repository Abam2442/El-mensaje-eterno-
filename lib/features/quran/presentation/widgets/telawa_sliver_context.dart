import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
class QariSliverAdapter extends StatelessWidget {
  const QariSliverAdapter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: SingleChildScrollView(
        child: Column(children: [
          QariItem(qariName: 'qariName', isSaved: true),
          QariItem(qariName: 'qariName', isSaved: true),
          QariItem(qariName: 'qariName', isSaved: false),
          QariItem(qariName: 'qariName', isSaved: false),
          QariItem(qariName: 'qariName', isSaved: false),
          QariItem(qariName: 'qariName', isSaved: true),
          QariItem(qariName: 'qariName', isSaved: true),
          QariItem(qariName: 'qariName', isSaved: false),
          QariItem(qariName: 'qariName', isSaved: true),
          QariItem(qariName: 'qariName', isSaved: false),
        ]),
      ),
    );
  }
}

class QariItem extends StatelessWidget {
  const QariItem({super.key, required this.qariName, required this.isSaved});
  final String qariName;
  final bool isSaved;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: AppColors.kGreenColor,
      ),
      child: Row(children: [
        Image.asset(AppAssets.kSoudisIcon),
        const SizedBox(
          width: 20,
        ),
        Text(
          qariName,
          style: const TextStyle(
            color:AppColors. kGoldenColor,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Spacer(),
        SvgPicture.asset(AppAssets.kDownloadIcon),
        const SizedBox(
          width: 30,
        ),
        SvgPicture.asset(
          isSaved == true ?AppAssets. kBookmarkFillIcon :AppAssets. kBookmarkIcon,
        ),
      ]),
    );
  }
}
