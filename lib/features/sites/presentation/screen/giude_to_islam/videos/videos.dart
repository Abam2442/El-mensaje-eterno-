
 import 'package:flutter/material.dart';
 import 'package:get/get.dart';
 import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
 import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/guide_to_islam/guide_to_islam_videos_controller.dart';
 import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/media_files_list_view.dart';
 import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/view_or_download_inkwell.dart';
 
 class GudidToIslamVideosScreen extends StatelessWidget {
   const GudidToIslamVideosScreen({super.key});
 
   @override
   Widget build(BuildContext context) {
     return GetBuilder(
       builder: (GuideToIslamVideosControllerImp controller) =>
           controller.getDataState == StateType.loading
               ? const Center(
                   child: CircularProgressIndicator(),
                 )
               : MediaFilesListView(
                   title: "Guide To Islam Videos",
                   data: controller.data,
                   mediaLinkType: MediaLinkType.video,
                 ),
     );
   }
 }