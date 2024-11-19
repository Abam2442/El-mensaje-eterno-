import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/utils/components/appbar/direction_aware.dart';
import 'package:hiwayda_oracion_islamica/features/telegram_channels/data/models/telegram_channels_model.dart';
import 'package:hiwayda_oracion_islamica/features/telegram_channels/presentation/screens/telegram_channels_messages_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TelegramSearchDelegate extends SearchDelegate {
  final List channelsNameList;
  final List<TelegramChannel> channelMessagesList;
  List? channelsNameFilterList;

  // List? channelsMessagesFilterList;
  TelegramSearchDelegate(
      {super.searchFieldLabel,
      super.searchFieldStyle,
      super.searchFieldDecorationTheme,
      super.keyboardType,
      super.textInputAction,
      required this.channelsNameList,
      required this.channelMessagesList});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close),
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return !Navigator.canPop(context)
        ? null
        : DirectionAware(
            // من شان تدوير الايقونة بزاوية 90
            //DirectionAware for rotate the icon to other side rtl or ltr
            child: GestureDetector(
              onTap: () {
                close(context, null);
              },
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
          );
  }

  @override
  Widget buildResults(BuildContext context) {
    return channelsItems();
    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: TabBar(
    //       tabs: [
    //         Tab(
    //           child: Text('Group'),
    //         ),
    //         Tab(
    //           child: Text('Messages'),
    //         ),
    //       ],
    //     ),

    //     //  backgroundColor: AppColors.kPrimaryColor,
    //     body: TabBarView(children: [
    //       channelsItems(),
    //       Text('data')
    //     ]),
    //   ),
    // );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return channelsItems();
    // return Scaffold(
    //   backgroundColor: AppColors.kPrimaryColor,

    //   //  body: ,
    //   //  ListView.builder(
    //   //   itemCount: channelMessagesList.first.messages.length,
    //   //   itemBuilder: (BuildContext context, int index) {
    //   //     return Card(
    //   //       color: AppColors.kGreenColor,
    //   //       shape: const RoundedRectangleBorder(
    //   //         borderRadius: BorderRadius.only(
    //   //             bottomLeft: Radius.elliptical(20, 20),
    //   //             topLeft: Radius.elliptical(20, 20),
    //   //             topRight: Radius.elliptical(20, 20),
    //   //             bottomRight: Radius.elliptical(10, 20)),
    //   //       ),
    //   //       child: Column(
    //   //         children: [

    //   //           ListTile(
    //   //             title: Text(
    //   //               channelMessagesList.first.messages.values.toList()[index],
    //   //               style: Styles.textStyle14Golden,
    //   //             ),
    //   //           ),
    //   //           Row(
    //   //             mainAxisAlignment: MainAxisAlignment.end,
    //   //             children: [
    //   //               IconButton(
    //   //                 onPressed: () {},
    //   //                 icon: IconButton(
    //   //                   icon: SvgPicture.asset(
    //   //                     AppAssets.copy,
    //   //                   ),
    //   //                   onPressed: () {},
    //   //                 ),
    //   //               ),
    //   //               IconButton(
    //   //                 onPressed: () {},
    //   //                 icon: IconButton(
    //   //                   icon: SvgPicture.asset(
    //   //                     AppAssets.share,
    //   //                     color: AppColors.kGoldenColor,
    //   //                   ),
    //   //                   onPressed: () {},
    //   //                 ),
    //   //               ),
    //   //             ],
    //   //           )
    //   //         ],
    //   //       ),
    //   //     );
    //   //   },
    //   // ),
    // );
  }

  Builder channelsItems() {
    return Builder(
      builder: (context) {
        if (query == '') {
          return Scaffold(
            backgroundColor: AppColors.kWhiteColor,
            body: ListView.builder(
              itemCount: channelsNameList.length,
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(
                      () => TelegramChannelsMessagesScreen(
                        channelMessages: channelMessagesList[index],
                        channelName: channelsNameList[index],
                      ),
                    );
                  },
                  child: Card(
                    elevation: 0,
                    color: AppColors.kGreenColor,
                    child: ListTile(
                      //  isThreeLine: true,
                      title: Text(
                        channelsNameList[index],
                        style: Styles.textStyle18Godlen,
                      ),
                      leading: const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/svg/images/zaghrafa.png'),
                        backgroundColor: AppColors.kGreenColor,
                      ),
                      subtitle: Text(
                        '${channelMessagesList[index].messages.values.toList().last} Messages',
                        maxLines: 2,
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: Container(
                        height: 20,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.kPrimaryColor,
                        ),
                        child: Center(
                          child: Text(
                            '${channelMessagesList[index].messages.length}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          channelsNameFilterList = channelsNameList
              .where((element) => element.contains(query))
              .toList();
          return Scaffold(
            backgroundColor: AppColors.kWhiteColor,
            body: ListView.builder(
              itemCount: channelsNameFilterList!.length,
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(
                      () => TelegramChannelsMessagesScreen(
                        channelMessages: channelMessagesList[index],
                        channelName: channelsNameFilterList![index],
                      ),
                    );
                  },
                  child: Card(
                    elevation: 0,
                    color: AppColors.kGreenColor,
                    child: ListTile(
                      //  isThreeLine: true,
                      title: Text(
                        channelsNameFilterList![index],
                        style: Styles.textStyle18Godlen,
                      ),
                      leading: const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/svg/images/zaghrafa.png'),
                        backgroundColor: AppColors.kGreenColor,
                      ),
                      subtitle: Text(
                        '${channelMessagesList[index].messages.values.toList().last} Messages',
                        maxLines: 2,
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: Container(
                        height: 20,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.kPrimaryColor,
                        ),
                        child: Center(
                          child: Text(
                            '${channelMessagesList[index].messages.length}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
