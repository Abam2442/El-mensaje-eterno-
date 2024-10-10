import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/youtubechannels/data/models/youtube_model.dart';
import 'package:hiwayda_oracion_islamica/features/youtubechannels/presentation/screens/playlist_screen.dart';
import 'package:hiwayda_oracion_islamica/features/youtubechannels/presentation/screens/shorts_screem.dart';
import 'package:hiwayda_oracion_islamica/features/youtubechannels/presentation/screens/videos_screen.dart';

class CardDetailsChannels extends StatelessWidget {
  String? text;
  String? num;
  YoutubeModel? data;
  CardDetailsChannels({super.key, this.num, this.text, this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (text == 'Playlist Channels') {
          Get.to(() => PlaylistScreen(data: data!),
              transition: Transition.cupertino);
        } else if (text == 'Shorts Channels') {
          Get.to(() => ShortScreen(data: data!),
              transition: Transition.cupertino);
        } else {
          Get.to(
              () => VideosScreen(
                    data: data!,
                  ),
              transition: Transition.cupertino);
        }
      },
      child: Card(
        elevation: 0,
        color: AppColors.kGreenColor,
        child: ListTile(
          //  isThreeLine: true,
          title: Row(
            children: [
              Expanded(
                child: Text(
                  text!,
                  style: Styles.textStyle18Golden,
                ),
              ),
              IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    textDirection: TextDirection.rtl,
                  ),
                  onPressed: () {
                    if (text == 'Playlist Channels') {
                      Get.to(() => PlaylistScreen(data: data!),
                          transition: Transition.cupertino);
                    } else if (text == 'Shorts Channels') {
                      Get.to(() => ShortScreen(data: data!),
                          transition: Transition.cupertino);
                    } else {
                      Get.to(
                          () => VideosScreen(
                                data: data!,
                              ),
                          transition: Transition.cupertino);
                    }
                  }),
            ],
          ),
          leading: CircleAvatar(
              backgroundImage:
                  const AssetImage('assets/svg/images/zaghrafa.png'),
              backgroundColor: AppColors.kGreenColor,
              child: Text(num!)),
        ),
      ),
    );
  }
}
