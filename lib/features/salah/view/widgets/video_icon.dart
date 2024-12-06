import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_api_routes.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_images.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/widgets/video_palyer_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class VideoIcon extends StatefulWidget {
  String videoPath;

  VideoIcon({required this.videoPath, Key? key}) : super(key: key);

  @override
  State<VideoIcon> createState() => _VideoIconState();
}

class _VideoIconState extends State<VideoIcon> {
  late VideoPlayerController videoPlayerController;
  bool isInitialize = false;

  @override
  void initState() {
    ini();
    super.initState();
  }

  Future ini() async {
    if (!widget.videoPath.startsWith('http')) {
      log('[${widget.videoPath}]');
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/Videos/${widget.videoPath}';
      final file = File(filePath);
      videoPlayerController = file.existsSync()
          ? (VideoPlayerController.file(file)
            ..initialize().then((_) {
              setState(() {
                isInitialize = true;
              });
            }))
          : VideoPlayerController.networkUrl(
              Uri.parse('${AppApiRoutes.videoApi}${widget.videoPath}'))
        ..initialize().then((_) {
          setState(() {
            isInitialize = true;
          });
        });
    }
  }

  @override
  void dispose() {
    //print('videoPlayerController disposed ${widget.videoPath}');
    if (!widget.videoPath.startsWith('http')) {
      videoPlayerController.pause();
      videoPlayerController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          if (widget.videoPath.startsWith('http')) {
            Uri uri = Uri.parse(widget.videoPath);
            if (!await launchUrl(uri)) {
              throw Exception('Could not launch $uri');
            }
          } else {
            showGeneralDialog(
                context: context,
                pageBuilder: (_, __, ___) {
                  return VideoPlayerWidget(controller: videoPlayerController);
                });
          }
        },
        child: SizedBox(
            width: 200,
            height: 200,
            child: (widget.videoPath.startsWith('http'))
                ? Image.asset(AppImages.youtube)
                : ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    // Image border
                    child: SizedBox.fromSize(
                        size: Size.fromRadius(context.width * 0.5),
                        // Image radius
                        child: Stack(
                          children: [
                            isInitialize == false
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : VideoPlayer(videoPlayerController),
                            const Center(
                                child: Icon(
                              Icons.play_arrow,
                              color: AppColors.kGoldenColor,
                              size: 50,
                            )),
                          ],
                        )),
                  )

            // SvgPicture.asset(AppSvgs.videoIcon),
            ));
  }
}
