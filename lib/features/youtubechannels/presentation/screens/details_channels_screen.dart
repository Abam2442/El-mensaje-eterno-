import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/utils/components/appbar/direction_aware.dart';
import 'package:hiwayda_oracion_islamica/features/youtubechannels/data/models/youtube_model.dart';
import 'package:hiwayda_oracion_islamica/features/youtubechannels/presentation/widgets/card_details_channels_widget.dart';

class DetailsChannelsScreen extends StatelessWidget {
  final YoutubeModel data;
  const DetailsChannelsScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: !Navigator.canPop(context)
            ? null
            : DirectionAware(
                // من شان تدوير الايقونة بزاوية 90
                //DirectionAware for rotate the icon to other side rtl or ltr
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 25,
                    ),
                    child: SvgPicture.asset(
                      AppAssets.kBackIcon,
                      color: AppColors.gray,
                    ),
                  ),
                ),
              ),
        backgroundColor: AppColors.kPrimaryColor,
        title: Text(
          data.namechannel!,
          style: Styles.textStyle18Godlen,
        ),
      ),
      body: Column(
        children: [
          CardDetailsChannels(
            text: 'Playlist Channels',
            num: '1',
            data: data,
          ),
          const SizedBox(
            height: 20,
          ),
          CardDetailsChannels(
            text: 'Videos Channels',
            num: '2',
            data: data,
          ),
          const SizedBox(
            height: 20,
          ),
          CardDetailsChannels(
            text: 'Shorts Channels',
            num: '3',
            data: data,
          ),
        ],
      ),
    );
  }
}
