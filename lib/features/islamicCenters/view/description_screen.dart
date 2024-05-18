import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/services/easy_loader_service.dart';
import '../controller/islamic_center_controller.dart';
class DescriptionScreen extends StatelessWidget {
  DescriptionScreen({required this.countryIndex,required this.centerIndex, super.key});
  final int countryIndex;
  final int centerIndex;
  IslamicCenterController islamicCenterController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('${islamicCenterController.islamicCenterModel.countries![countryIndex].centers![centerIndex].title}'),),
        actions: [
          IconButton(onPressed:() async {
            var data = ClipboardData(text:'${islamicCenterController.islamicCenterModel.countries![countryIndex].centers![centerIndex].description} /n '
                ' ${islamicCenterController.islamicCenterModel.countries![countryIndex].centers![centerIndex].address}');
            await Clipboard.setData(data);
            EasyLoaderService.showToast(message: "Copied");
          },
            icon: SvgPicture.asset(
              AppAssets.kCopyIcon,
            ),)
        ],
      ),
      backgroundColor: AppColors.kPrimaryColor,
      body: SingleChildScrollView(
        child: Padding(
            padding: 10.aEdge,
            child: Column(
    children: [
      SelectableText('${islamicCenterController.islamicCenterModel.countries![countryIndex].centers![centerIndex].description}',style: Styles.textStyle18Godlen,),
      SelectableText('${islamicCenterController.islamicCenterModel.countries![countryIndex].centers![centerIndex].address}',style: Styles.textStyle18Godlen,),
    ],
    )
      ),
    ));
  }
}
