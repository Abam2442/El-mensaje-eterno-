import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: const BoxDecoration(
          color: AppColors.kPrimaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Download Screen',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontFamily: 'Poppins'),
          ),
          Text(
            'Make Your Application Offline',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontFamily: 'Poppins'),
          )
        ],
      ),
    );
  }
}
