import 'package:hiwayda_oracion_islamica/core/constants/app_routes.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/context_size.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayerWidget({required this.controller, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async {
        controller.pause();},
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: controller.value.isInitialized
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

  Widget buildVideoPlayer(BuildContext context) => Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: context.height * 0.6,
            width: context.width,
            child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller)),
          ),
          VideoProgressIndicator(controller, allowScrubbing: true),
          20.hSize,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  controller.play();
                },
                child: const Icon(Icons.play_arrow, size: 50, color: Colors.white),
              ),
              10.hSize,
              InkWell(
                onTap: () {
                  if (controller.value.isPlaying) controller.pause();
                },
                child: const Icon(Icons.pause, size: 50, color: Colors.white),
              ),
              50.hSize,
              InkWell(
                onTap: () {
                  if (controller.value.isPlaying) controller.pause();
                  AppRoutes.pop(context);
                },
                child:
                    const Icon(Icons.cancel_outlined, size: 50, color: Colors.white),
              ),
            ],
          ),
        ],
      );
}
