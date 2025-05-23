
 import 'package:flutter/material.dart';
 import 'package:get/get.dart';
 import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/guide_to_islam/guide_to_islam_audios_controller.dart';
 import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/app_bar_custom.dart';
 import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/view_or_download_inkwell.dart';
 
 class GudidToIslamAudiosScreen extends StatelessWidget {
   const GudidToIslamAudiosScreen({super.key});
 
   @override
   Widget build(BuildContext context) {
     return Scaffold(
         appBar: const AppBarCustom(title: 'Guide To Islam Audios')
             .customAppBar(context),
         body: GetBuilder<GuideToIslamAudiosControllerImp>(
             builder: (controller) => Container(
                 margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                 child: ListView.builder(
                     padding: const EdgeInsets.all(5),
                     itemCount: controller.data.length,
                     itemBuilder: (context, index) {
                       return ViewOrDownloadInkwell(
                         fileType: 'mp3',
                         name: controller.data[index].name,
                         url: controller.data[index].url,
                         mediaLinkType: MediaLinkType.downloadAndListen,
                       );
                     }))));
   }
 }