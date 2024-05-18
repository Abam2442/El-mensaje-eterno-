import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/services/easy_loader_service.dart';
class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({required this.des, super.key});
final String des;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Description'),),
        actions: [
          IconButton(onPressed:() async {
            var data = ClipboardData(text:des);
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
            child: SelectableText(des,style: Styles.textStyle18Godlen,)),
      ),
    );
  }
}
