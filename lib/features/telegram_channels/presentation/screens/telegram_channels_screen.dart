import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/utils/components/appbar/direction_aware.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/handle_states_widget.dart';
import 'package:hiwayda_oracion_islamica/features/telegram_channels/presentation/controller/telegram_channels_controller.dart';
import 'package:hiwayda_oracion_islamica/features/telegram_channels/presentation/screens/telegram_channels_messages_screen.dart';
import 'package:hiwayda_oracion_islamica/features/telegram_channels/presentation/widgets/telegram_search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class TelegramChannelsScreen extends StatelessWidget {
  const TelegramChannelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: TelegramChannelsController(),
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
              'Telegram Channels',
              style: Styles.textStyle18Godlen,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: TelegramSearchDelegate(
                      channelsNameList: controller.channelsNames,
                      channelMessagesList: controller.channelMessagesList,
                    ),
                  );
                },
                icon: const Icon(Icons.search),
              )
            ],
          ),
          body: HandleStatesWidget(
            stateType: controller.getTelegramChannelsState,
            child: ListView.builder(
              itemCount: controller.channelsNames.length,
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(
                      () => TelegramChannelsMessagesScreen(
                        channelMessages: controller.channelMessagesList[index],
                        channelName: controller.channelsNames[index],
                      ),
                    );
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
                              controller.channelsNames[index],
                              style: Styles.textStyle18Golden,
                            ),
                          ),
                          IconButton(
                              icon: const Icon(Icons.info),
                              onPressed: () {
                                launchUrl(Uri.parse(
                                    'https://t.me/${controller.channelsNames[index]}'));
                              }),
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
                      trailing: Container(
                        height: 20,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.kPrimaryColor,
                        ),
                        child: Center(
                          child: Text(
                            '${controller.channelMessagesList[index].messages.length}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
