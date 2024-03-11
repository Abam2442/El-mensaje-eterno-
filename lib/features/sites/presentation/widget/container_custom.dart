import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class ContainerCustom extends StatelessWidget {
  final bool catigory;
  final IconData? iconData;
  final String dataText;
  const ContainerCustom({
    super.key,
    required this.catigory,
    this.iconData,
    required this.dataText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      margin: const EdgeInsets.only(top: 15, right: 15, left: 15),
      decoration: BoxDecoration(
          color: AppColors.kGreenColor,
          border: Border.all(color: AppColors.kGreenColor),
          borderRadius: BorderRadius.circular(15)),
      child: catigory == true
          ? Row(
              children: [
                Icon(
                  iconData,
                  color: AppColors.kGoldenColor,
                  size: 30,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  color: AppColors.kWhiteColor,
                  width: 1,
                  height: 40,
                ),
                Text(
                  dataText,
                  style: const TextStyle(
                      color: AppColors.kGoldenColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            )
          : Text(
              dataText,
              style: const TextStyle(
                  color: AppColors.kGoldenColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
    );
  }
}
