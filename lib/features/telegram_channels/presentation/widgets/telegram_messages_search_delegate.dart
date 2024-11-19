import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/utils/components/appbar/direction_aware.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TelegramMessagesSearcDelegate extends SearchDelegate {
  final List channelMessages;
  List? channelFilterdMessages;

  TelegramMessagesSearcDelegate(
      {super.searchFieldLabel,
      super.searchFieldStyle,
      super.searchFieldDecorationTheme,
      super.keyboardType,
      super.textInputAction,
      required this.channelMessages});

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
    return messageItem();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return messageItem();
  }

  Builder messageItem() {
    return Builder(
      builder: (context) {
        if (query == '') {
          return Scaffold(
            backgroundColor: AppColors.kWhiteColor,
            body: ListView.builder(
              //  reverse: true,
              itemCount: channelMessages.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: AppColors.kGreenColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.elliptical(20, 20),
                        topLeft: Radius.elliptical(20, 20),
                        topRight: Radius.elliptical(20, 20),
                        bottomRight: Radius.elliptical(10, 20)),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          channelMessages[index],
                          style: Styles.textStyle14Golden,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: IconButton(
                              icon: SvgPicture.asset(
                                AppAssets.kCopyIcon,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: IconButton(
                              icon: SvgPicture.asset(
                                AppAssets.kShareIcon,
                                color: AppColors.kGoldenColor,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          );
        } else {
          channelFilterdMessages = channelMessages
              .where((element) => element.contains(query))
              .toList();
          return Scaffold(
            backgroundColor: AppColors.kWhiteColor,
            body: ListView.builder(
              //  reverse: true,
              itemCount: channelFilterdMessages!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: AppColors.kGreenColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.elliptical(20, 20),
                        topLeft: Radius.elliptical(20, 20),
                        topRight: Radius.elliptical(20, 20),
                        bottomRight: Radius.elliptical(10, 20)),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          channelFilterdMessages![index],
                          style: Styles.textStyle14Golden,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: IconButton(
                              icon: SvgPicture.asset(
                                AppAssets.kCopyIcon,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: IconButton(
                              icon: SvgPicture.asset(
                                AppAssets.kShareIcon,
                                color: AppColors.kGoldenColor,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      )
                    ],
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
