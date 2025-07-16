import 'dart:developer';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_images.dart';
import 'package:hiwayda_oracion_islamica/core/constants/videos_url.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/widgets/video_palyer_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoIcon extends StatefulWidget {
  final String videoPath;

  const VideoIcon({required this.videoPath, super.key});

  @override
  State<VideoIcon> createState() => _VideoIconState();
}

class _VideoIconState extends State<VideoIcon> {
  CustomVideoPlayerController? customVideoPlayerController;
  bool isInitialize = false;

  @override
  void initState() {
    log('lol ${widget.videoPath}');
    ini();
    super.initState();
  }

  ini() {
          log('video00 : ${widget.videoPath}');
    if (!widget.videoPath.startsWith('http')) {
      VideoPlayerController videoPlayerController;
      if (widget.videoPath.startsWith('assets')) {
        log('drive video path: ${widget.videoPath}');
        String videoName = widget.videoPath.replaceFirst('assets/video/', '').replaceAll('.mp4', '').toLowerCase();
        log('videoName: $videoName');
        log('videoUrl: ${VideosUrl.getUrlByName(videoName)}');
        videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(VideosUrl.getUrlByName(videoName) ?? ''))
          ..initialize().then((_) {
            setState(() {
              isInitialize = true;
            });
          });
      } else {
        log('drive video path: ${widget.videoPath}');
        String videoName = widget.videoPath.replaceAll('.mp4', '').toLowerCase();
        log('videoName: $videoName');
        log('videoUrl: ${VideosUrl.getUrlByName(videoName)}');
        videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(VideosUrl.getUrlByName(videoName) ?? ''))
              ..initialize().then((_) {
                setState(() {
                  isInitialize = true;
                });
              });
      }
      customVideoPlayerController = CustomVideoPlayerController(
        context: context,
        videoPlayerController: videoPlayerController,
      );
    } else {
      log('network video path: ${widget.videoPath}');
    }
  }

  @override
  void dispose() {
    if (customVideoPlayerController != null) {
      customVideoPlayerController!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          if (customVideoPlayerController == null) {
            Uri uri = Uri.parse(widget.videoPath);
            if (!await launchUrl(uri)) {
              throw Exception('Could not launch $uri');
            }
          } else {
            showGeneralDialog(
                context: context,
                pageBuilder: (_, __, ___) {
                  return VideoPlayerWidget(
                      controller: customVideoPlayerController!);
                });
          }
        },
        child: SizedBox(
            width: 200,
            height: 200,
            child: (customVideoPlayerController == null)
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
                                : VideoPlayer(customVideoPlayerController!
                                    .videoPlayerController),
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
