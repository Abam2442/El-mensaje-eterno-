//import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_public_var.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/context_size.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioIcon extends StatefulWidget {
  final String audioPath;
  final String? transliteration;
  final int? index;

  const AudioIcon(
      {required this.audioPath, this.transliteration, this.index, Key? key})
      : super(key: key);

  @override
  State<AudioIcon> createState() => _AudioIconState();
}

class _AudioIconState extends State<AudioIcon> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  @override
  void initState() {
    audioPlayer.setAsset(widget.audioPath);
    audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        setState(() {
          isPlaying = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (widget.transliteration == null || widget.transliteration == '0')
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 2.w),
            width: context.width * 0.1,
            decoration: BoxDecoration(
              borderRadius: 15.cBorder,
              color: AppColors.kGreenColor,
            ),
            child: InkWell(
                onTap: () async {
                  if (!isPlaying) {
                    audioPlayer.play();
                  } else {
                    audioPlayer.pause();
                  }
                  setState(() {
                    isPlaying = !isPlaying;
                  });
                },
                child: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                )))
        : Container(
            width: context.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: 15.cBorder,
              color: AppColors.kGreenColor,
            ),
            child: ListTile(
              onTap: () async {
                print('playing sound');
              },
              title: Center(child: Text(widget.transliteration ?? '')),
              leading: CircleAvatar(
                backgroundColor: AppColors.kGoldenColor,
                child: Center(
                  child: (widget.index == null)
                      ? const Text('')
                      : Text((widget.index! + 1).toString()),
                ),
              ),
              trailing: SizedBox(
                  width: context.width * 0.15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {
                            if (!isPlaying) {
                              audioPlayer.play();
                            } else {
                              audioPlayer.pause();
                            }
                            setState(() {
                              isPlaying = !isPlaying;
                            });
                          },
                          child:  Icon(
                            isPlaying ? Icons.pause : Icons.play_arrow,
                          )),
                   
                    ],
                  )),
            ),
          );
  }
}
