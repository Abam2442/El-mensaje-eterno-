import 'package:flutter/services.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/services/easy_loader_service.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/utils/components/appbar/direction_aware.dart';
import 'package:hiwayda_oracion_islamica/features/telegram_channels/data/models/telegram_channels_model.dart';
import 'package:hiwayda_oracion_islamica/features/telegram_channels/presentation/controller/telegram_channels_controller.dart';
import 'package:hiwayda_oracion_islamica/features/telegram_channels/presentation/widgets/telegram_messages_search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class TelegramChannelsMessagesScreen extends StatefulWidget {
  final TelegramChannel channelMessages;
  final String channelName;

  const TelegramChannelsMessagesScreen({
    super.key,
    required this.channelMessages,
    required this.channelName,
  });

  @override
  State<TelegramChannelsMessagesScreen> createState() =>
      _TelegramChannelsMessagesScreenState();
}

class _TelegramChannelsMessagesScreenState
    extends State<TelegramChannelsMessagesScreen> {
  final ScrollController _scrollController = ScrollController();
  bool hideFloatingActionBotton = false;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    // final currentPosition = _scrollController.offset;
    if (_scrollController.position.atEdge) {
      setState(() {
        hideFloatingActionBotton = true;
      });
    } else if (hideFloatingActionBotton) {
      setState(() {
        hideFloatingActionBotton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (TelegramChannelsController controller) => PopScope(
        onPopInvoked: (_) => _pop(controller, _),
        child: Scaffold(
          floatingActionButton: !hideFloatingActionBotton
              ? FloatingActionButton(
                  onPressed: () {
                    _scrollController.jumpTo(
                      _scrollController.position.maxScrollExtent,
                    );
                  },
                  child: const Icon(Icons.keyboard_arrow_down),
                )
              : null,
          backgroundColor: AppColors.kWhiteColor,
          appBar: AppBar(
            title: Row(
              children: [
                Text(
                  widget.channelName,
                  style: Styles.textStyle18Godlen,
                ),
              ],
            ),
            elevation: 0,
            leading: !Navigator.canPop(context)
                ? null
                : DirectionAware(
                    // من شان تدوير الايقونة بزاوية 90
                    //DirectionAware for rotate the icon to other side rtl or ltr
                    child: GestureDetector(
                      onTap: () => _pop(controller, true),
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
            actions: [
              AnimatedCrossFade(
                  firstChild: IconButton(
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: TelegramMessagesSearcDelegate(
                              channelMessages: widget
                                  .channelMessages.messages.values
                                  .toList()),
                        );
                      },
                      icon: const Icon(Icons.search)),
                  secondChild: Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          List<String> data = [];
                          for (int index
                              in controller.selectedMessagesIndexes) {
                            data.add(widget.channelMessages.messages.values
                                .toList()
                                .reversed
                                .toList()[index]);
                          }

                          await Clipboard.setData(
                              ClipboardData(text: data.join('\n\n\n')));
                          EasyLoaderService.showToast(message: "Copied");
                        },
                        icon: SvgPicture.asset(
                          AppAssets.kCopyIcon,
                        ),
                      ),
                      // IconButton(
                      //   onPressed: controller.clearSelectedMessages,
                      //   icon: const Icon(
                      //     Icons.clear,
                      //     color: AppColors.amber,
                      //   ),
                      // )
                    ],
                  ),
                  crossFadeState: controller.multiSelectState,
                  duration: const Duration(seconds: 1))
            ],
          ),
          body: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            // reverse: true,
            itemCount: widget.channelMessages.messages.length,
            itemBuilder: (BuildContext context, int index) {
              final message = widget.channelMessages.messages.values
                  .toList()
                  .reversed
                  .toList()[index];
              return Row(
                children: [
                  AnimatedCrossFade(
                      firstChild: const SizedBox(),
                      secondChild: Checkbox(
                        onChanged: (value) =>
                            controller.addOrDeleteSelectedMessage(index),
                        value:
                            controller.selectedMessagesIndexes.contains(index),
                      ),
                      crossFadeState: controller.multiSelectState,
                      duration: const Duration(milliseconds: 500)),
                  Expanded(
                    child: GestureDetector(
                      onLongPress: () =>
                          controller.addOrDeleteSelectedMessage(index),
                      onTap: () {
                        if (controller.multiSelectState ==
                            CrossFadeState.showSecond) {
                          controller.addOrDeleteSelectedMessage(index);
                        }
                      },
                      child: Card(
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),

                              /// Linkify:> Flutter package that detects links within text and makes them accessible.
                              child: Linkify(
                                onOpen: _opnenLink,
                                text: message,
                                style: Styles.textStyle14White,
                                linkStyle: Styles.telegramMessagesLinksStyle,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    var data = ClipboardData(text: message);
                                    await Clipboard.setData(data);
                                    EasyLoaderService.showToast(
                                        message: "Copied");
                                  },
                                  icon: SvgPicture.asset(
                                    AppAssets.kCopyIcon,
                                  ),
                                ),
                                // ShareIconButton(
                                //   data: message,
                                // )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Future _opnenLink(LinkableElement link) async {
    final uri = Uri.parse(link.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      final Logger logger = Get.find();
      logger.e('failed to launch url :> ${uri.path}');
    }
  }

  Future<bool?> _pop(TelegramChannelsController controller, bool _) async {
    if (controller.multiSelectState == CrossFadeState.showSecond) {
      controller.clearSelectedMessages();
      return Future.value(false);
    } else {
      Get.back();
      return Future.value(_);
    }
  }
}
