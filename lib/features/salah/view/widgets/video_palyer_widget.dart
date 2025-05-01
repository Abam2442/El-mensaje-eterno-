import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_routes.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/context_size.dart';
import 'package:flutter/material.dart';

class VideoPlayerWidget extends StatelessWidget {
  final CustomVideoPlayerController controller;

  const VideoPlayerWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: controller.videoPlayerController.value.isInitialized
            ? Container(
                color: Colors.transparent,
                height: context.height * 0.8,
                width: context.width,
                child: buildVideoPlayer(context),
              )
            : const SizedBox(
                height: 200,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
      ),
    );
  }

  Widget buildVideoPlayer(BuildContext context) => SafeArea(
    child: Column(
          children: [
            SizedBox(
              width: context.width,
              child: AspectRatio(
                  aspectRatio: controller.videoPlayerController.value.aspectRatio,
                  child: CustomVideoPlayer(
                    customVideoPlayerController: controller,
                  )),
            ),
            Expanded(child: GestureDetector(
              onTap: () {
                AppRoutes.pop(context);
                controller.videoPlayerController.pause();
              },
            ))
          ],
        ),
  );
}
