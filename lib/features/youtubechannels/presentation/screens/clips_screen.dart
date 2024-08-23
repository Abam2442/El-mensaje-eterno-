import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/services/easy_loader_service.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/utils/components/appbar/direction_aware.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/pub_up_custom.dart';
import 'package:hiwayda_oracion_islamica/features/youtubechannels/data/models/youtube_model.dart';
import 'package:hiwayda_oracion_islamica/features/youtubechannels/presentation/screens/web_view_screen.dart';
//import 'package:url_launcher/url_launcher.dart';

class ClipsScreen extends StatelessWidget {
  final YoutubeModel data;
  final int indexplay;
  const ClipsScreen({super.key, required this.data, required this.indexplay});

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
          data.playlists![indexplay].listname!,
          style: Styles.textStyle18Godlen,
        ),
      ),
      body: ListView.builder(
        itemCount: data.playlists![indexplay].listclips!.length,
        shrinkWrap: true,
        primary: false,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Get.to(() => ClipsScreen(data: data, index: index,));
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
                        data.playlists![indexplay].listclips![index].videoName!,
                        style: Styles.textStyle18Golden,
                      ),
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () async {
                            var data1 = ClipboardData(
                                text: data.playlists![indexplay]
                                    .listclips![index].videoUrl!);
                            await Clipboard.setData(data1);
                            EasyLoaderService.showToast(
                                message: "Copied url video");
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
                                      Urlweb: data.playlists![indexplay]
                                          .listclips![index].videoUrl!,
                                      title: data.playlists![indexplay]
                                          .listclips![index].videoName!),
                                  transition: Transition.cupertino);
                              // launchUrl(Uri.parse(data.playlists![indexplay]
                              //     .listclips![index].videoUrl!));
                            }),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return PubUpCustom(
                                      body: data.playlists![indexplay]
                                          .listclips![index].videoDescription!,
                                      link: '',
                                    );
                                  });
                            },
                            icon: const Icon(
                              Icons.info,
                              color: AppColors.kGoldenColor,
                            )),
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
