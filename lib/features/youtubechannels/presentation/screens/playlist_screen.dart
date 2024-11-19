import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/services/easy_loader_service.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/utils/components/appbar/direction_aware.dart';
import 'package:hiwayda_oracion_islamica/features/youtubechannels/data/models/youtube_model.dart';
import 'package:hiwayda_oracion_islamica/features/youtubechannels/presentation/screens/clips_screen.dart';
import 'package:hiwayda_oracion_islamica/features/youtubechannels/presentation/screens/web_view_screen.dart';
//import 'package:url_launcher/url_launcher.dart';

class PlaylistScreen extends StatelessWidget {
  final YoutubeModel data;
  const PlaylistScreen({super.key, required this.data});

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
      body: ListView.builder(
        itemCount: data.playlists!.length,
        shrinkWrap: true,
        primary: false,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(
                  () => ClipsScreen(
                        data: data,
                        indexplay: index,
                      ),
                  transition: Transition.cupertino);
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
                        data.playlists![index].listname!,
                        style: Styles.textStyle18Golden,
                      ),
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () async {
                            var data1 = ClipboardData(
                                text: data.playlists![index].listlink!);
                            await Clipboard.setData(data1);
                            EasyLoaderService.showToast(
                                message: "Copied url playlist");
                          },
                          icon: SvgPicture.asset(
                            AppAssets.kCopyIcon,
                          ),
                        ),
                        IconButton(
                            icon: const Icon(
                              Icons.open_in_browser,
                              color: Color.fromARGB(255, 193, 193, 13),
                            ),
                            onPressed: () {
                              Get.to(
                                  () => WebViweScreen(
                                      Urlweb: data.playlists![index].listlink!,
                                      title: data.playlists![index].listname!),
                                  transition: Transition.cupertino);
                              //launchUrl(Uri.parse(data.playlists![index].listlink!));
                            }),
                      ],
                    ),
                  ],
                ),
                leading: CircleAvatar(
                    backgroundImage:
                        const AssetImage('assets/svg/images/zaghrafa.png'),
                    backgroundColor: AppColors.kGreenColor,
                    child: Text('${index + 1}')),
              ),
            ),
          );
        },
      ),
    );
  }
}
