import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_strings.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/context_size.dart';
import 'package:hiwayda_oracion_islamica/views/widgets/call_me.dart';
import 'package:flutter/material.dart';
class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      appBar: AppBar(
        title: Center(
          child: Text('Call Us'),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: (context.height*0.2).toInt().tEdge,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.kWhiteColor,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(35)),
                ),
                margin: 50.tEdge,
                height: context.height,
                ),
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Image.asset('assets/images/me.jpg',
                          width: 150,
                          fit: BoxFit.fill,
                          height: 150,
                        ),
                      ),
                    ),
                    5.hSize,
                    Text('Eng.Mahmoud Soufan',style: AppTextStyles.h4,),
                    10.hSize,
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text('Mobile Application Developer',style: AppTextStyles.h5,),
                            10.hSize,
                            Text('Mahmoud.Soufan313@gmail.com',style: AppTextStyles.h5,),
                            10.hSize,
                            CallMe(
                              whatsapp: AppStrings.whatsappAbout,
                              messenger: AppStrings.messengerAbout,
                              message: 'I am Using Learn Salah App',),
                            20.hSize,
                            Text('For Islamic Information Contact With\n Dr.Bassem Ahmad',style: AppTextStyles.h5,),
                            10.hSize,
                            Text('Alresalaalkhaleda@gmail.com',style: AppTextStyles.h5,),
                            10.sSize,
                            CallMe(
                              whatsapp: AppStrings.whatsappUrl,
                              messenger: AppStrings.messengerUrl,
                              message: 'I am Using Learn Salah App',),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
