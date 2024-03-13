import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_public_var.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/context_size.dart';
import 'package:flutter/material.dart';

class AudioIcon extends StatelessWidget {
  String audioPath;
  String? transliteration;
  int? index;

  AudioIcon(
      {required this.audioPath, this.transliteration, this.index, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (transliteration == null || transliteration == '0')
        ? Container(
            width: context.width * 0.1,
            decoration: BoxDecoration(
              borderRadius: 15.cBorder,
              color: AppColors.kGreenColor,
            ),
            child: Column(
              children: [
                InkWell(
                    onTap: () {
                      if (!AppPublicVar.assetsAudioPlayer.isPlaying.value) {
                        AppPublicVar.assetsAudioPlayer.open(Audio(
                          audioPath,
                        ));
                      }
                    },
                    child: const Icon(
                      Icons.play_arrow,
                    )),
                10.sSize,
                InkWell(
                    onTap: () {
                      AppPublicVar.assetsAudioPlayer.stop();
                    },
                    child: const Icon(Icons.stop)),
              ],
            )

          )
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
              title: Center(child: Text(transliteration ?? '')),
              leading: CircleAvatar(
                backgroundColor: AppColors.kGoldenColor,
                child: Center(
                  child: (index == null)
                      ? const Text('')
                      : Text((index! + 1).toString()),
                ),
              ),
              trailing: Container(
                  width: context.width * 0.15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                            onTap: () {
                              if (!AppPublicVar
                                  .assetsAudioPlayer.isPlaying.value) {
                                AppPublicVar.assetsAudioPlayer.open(Audio(
                                  audioPath,
                                ));
                              }
                            },
                            child: const Icon(
                              Icons.play_arrow,
                            )),
                      ),
                      5.hSize,
                      Expanded(
                        flex: 1,
                        child: InkWell(
                            onTap: () {
                              AppPublicVar.assetsAudioPlayer.stop();
                            },
                            child: const Icon(Icons.stop)),
                      ),
                    ],
                  )),
            ),
          );
  }
}
