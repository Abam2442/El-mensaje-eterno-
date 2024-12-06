// import 'dart:developer';
// import 'dart:io';
// import 'package:get/get.dart';
// import 'package:hiwayda_oracion_islamica/core/constants/app_api_routes.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:video_player/video_player.dart';

// class VideoController extends GetxController {
//   late VideoPlayerController videoPlayerController;
//   var isInitialized = false.obs;

//   Future<void> ini(String videoPath) async {
//     log('mmmmm');
//     if (!videoPath.startsWith('http')) {
//       final directory = await getApplicationDocumentsDirectory();
//       final filePath = '${directory.path}/Videos/$videoPath';
//       final file = File(filePath);

//       if (await file.exists()) {
//         log('eeee');

//         videoPlayerController = VideoPlayerController.file(file);
//       } else {
//         log('nnnnn');

//         videoPlayerController = VideoPlayerController.networkUrl(
//             Uri.parse('${AppApiRoutes.videoApi}$videoPath'));
//       }

//       await videoPlayerController.initialize();
//       isInitialized.value = true;
//     }
//   }

//   @override
//   void onClose() {
//     videoPlayerController.dispose();
//     super.onClose();
//   }
// }
