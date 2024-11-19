import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_pages_routes.dart';
import 'package:hiwayda_oracion_islamica/core/services/easy_loader_service.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/utils/components/appbar/direction_aware.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/handle_states_widget.dart';
import 'package:hiwayda_oracion_islamica/features/youtubechannels/presentation/controller/youtube_channels_controller.dart';
import 'package:hiwayda_oracion_islamica/features/youtubechannels/presentation/screens/web_view_screen.dart';
//import 'package:url_launcher/url_launcher.dart';

class YoutubeChannelsScreen extends StatelessWidget {
  const YoutubeChannelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: YoutubeChannelsController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.kWhiteColor,
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
              title: const Text(
                'Youtube Channels',
                style: Styles.textStyle18Godlen,
              ),
            ),
            body: HandleStatesWidget(
              stateType: controller.getYoutubeChannelsState,
              child: ListView.builder(
                itemCount: controller.youtube_model.length,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(AppPagesRoutes.detailsChannelsScreen,
                          arguments: [
                            {'data': controller.youtube_model[index]}
                          ]);
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
                                controller.youtube_model[index].namechannel!,
                                style: Styles.textStyle18Golden,
                              ),
                            ),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    var data = ClipboardData(
                                        text: controller
                                            .youtube_model[index].urlchannel!);
                                    await Clipboard.setData(data);
                                    EasyLoaderService.showToast(
                                        message: "Copied url channel");
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
                                      //  launchUrl(Uri.parse(controller.youtube_model[index].urlchannel!));
                                      Get.to(
                                          () => WebViweScreen(
                                              Urlweb: controller
                                                  .youtube_model[index]
                                                  .urlchannel!,
                                              title: controller
                                                  .youtube_model[index]
                                                  .namechannel!),
                                          transition: Transition.cupertino);
                                    }),
                              ],
                            ),
                          ],
                        ),
                        leading: CircleAvatar(
                            backgroundImage: const AssetImage(
                                'assets/svg/images/zaghrafa.png'),
                            backgroundColor: AppColors.kGreenColor,
                            child: Text('${index + 1}')),
                        // subtitle: Text(
                        //   '${controller.channelMessagesList[index].messages.values.toList().last} Messages',
                        //   maxLines: 2,
                        //   style: const TextStyle(color: Colors.white),
                        // ),
                        // trailing: Container(
                        //   height: 20,
                        //   width: 35,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10),
                        //     color: AppColors.kPrimaryColor,
                        //   ),
                        //   child: Center(
                        //     child:
                        //       Text(
                        //         '${controller.youtube_model[index].}',
                        //         style: const TextStyle(color: Colors.white),
                        //       ),
                        //   ),
                        // ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        });
  }
}
