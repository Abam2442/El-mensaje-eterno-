import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/core/helpers/get_state_from_failure.dart';
import 'package:hiwayda_oracion_islamica/core/services/easy_loader_service.dart';
import 'package:hiwayda_oracion_islamica/features/telegram_channels/data/models/telegram_channels_model.dart';
import 'package:hiwayda_oracion_islamica/features/telegram_channels/domain/usecases/get_telegram_channels_usecases.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class TelegramChannelsController extends GetxController {
  // Data
  TelegramChannels? channelsModel;
  List channelsNames = [];
  List<TelegramChannel> channelMessagesList = [];
  // States
  StateType getTelegramChannelsState = StateType.init;

  /// multi message selection state,, use CrossFadeState.showSecond to activate multiSelection
  CrossFadeState multiSelectState = CrossFadeState.showFirst;

  /// list of all seleted messages index
  Set<int> selectedMessagesIndexes = {};

  // Primitive
  String validationMessage = '';

  @override
  void onInit() async {
    Get.find<Logger>().i("Start onInit TelebgramChannelsController");
    super.onInit();
    await getTelegramChannels();
    Get.find<Logger>().w("End onInit TelegramChannelsController");
  }

  Future<void> getTelegramChannels() async {
    Get.find<Logger>()
        .i("Start `getTelegramChannels` in |TelegramChannelsController|");
    getTelegramChannelsState = StateType.loading;
    update();
    GetTelegramChannelsUseCase getTelegramChannelsUseCase =
        GetTelegramChannelsUseCase(Get.find());
    var result = await getTelegramChannelsUseCase();
    result.fold(
      (l) async {
        getTelegramChannelsState = getStateFromFailure(l);
        validationMessage = l.message;
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        getTelegramChannelsState = StateType.init;
      },
      (r) {
        getTelegramChannelsState = StateType.success;
        channelsModel = r;
        channelsModel?.telegramChannels.forEach((channelName, channelMessages) {
          channelsNames.add(channelName);
          channelMessagesList.add(channelMessages);
        });
        update();
      },
    );
    Get.find<Logger>().w(
        "End `getTelegramChannels` in |TelegramChannelsController| $getTelegramChannelsState");
  }

  addOrDeleteSelectedMessage(int index) {
    if (multiSelectState == CrossFadeState.showFirst) {
      multiSelectState = CrossFadeState.showSecond;
    }
    if (selectedMessagesIndexes.contains(index)) {
      selectedMessagesIndexes.remove(index);
    } else {
      selectedMessagesIndexes.add(index);
    }
    update();
  }

  clearSelectedMessages() {
    selectedMessagesIndexes.clear();
    if (multiSelectState == CrossFadeState.showSecond) {
      multiSelectState = CrossFadeState.showFirst;
    }
    update();
  }
}
