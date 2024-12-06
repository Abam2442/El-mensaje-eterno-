// import 'dart:developer';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:video_player/video_player.dart';

// class TestScreen extends StatefulWidget {
//   const TestScreen({super.key});

//   @override
//   State<TestScreen> createState() => _TestScreenState();
// }

// class _TestScreenState extends State<TestScreen> {
//   late VideoPlayerController videoPlayerController;
//   handlePlayer() async {
//     // log(x)
//     final directory = await getApplicationDocumentsDirectory();
//     final filePath = '${directory.path}/Videos/Aljalsa.mp4';
//     final file = File(filePath);
//     log(file.existsSync().toString());

//     videoPlayerController = VideoPlayerController.file(file);
//     videoPlayerController.initialize();
//   }

//   @override
//   void initState() {
//     handlePlayer();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: VideoPlayer(videoPlayerController),
//     );
//   }
// }
