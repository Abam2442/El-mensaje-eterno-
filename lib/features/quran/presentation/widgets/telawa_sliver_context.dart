import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';

import '../../controller/telawa_controller.dart';

class QariSliverAdapter extends StatelessWidget {
  const QariSliverAdapter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TelawaController>(builder: (telawaController) {
      return SliverList.builder(
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            telawaController
                .updateSelectedReader(telawaController.readers[index]);
            Navigator.pop(context);
          },
          child: QariItem(
              qariName: telawaController.readers[index].name,
              isSaved: telawaController.readers[index].id ==
                  telawaController.selectedReader.id),
        ),
        itemCount: telawaController.readers.length,
      );
    });
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
        Expanded(
          child: Text(
            qariName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.kGoldenColor,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SvgPicture.asset(AppAssets.kDownloadIcon),
        const SizedBox(
          width: 10,
        ),
        SvgPicture.asset(
          isSaved == true
              ? AppAssets.kBookmarkFillIcon
              : AppAssets.kBookmarkIcon,
        ),
      ]),
    );
  }
}
