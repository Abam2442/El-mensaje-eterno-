import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/core/helpers/get_state_from_failure.dart';
import 'package:hiwayda_oracion_islamica/features/youtubechannels/data/models/youtube_model.dart';
import 'package:hiwayda_oracion_islamica/features/youtubechannels/domain/usecases/get_youtube_channels_usecases.dart';
import 'package:logger/logger.dart';

class YoutubeChannelsController extends GetxController {
  List<YoutubeModel> youtube_model = [];
  StateType getYoutubeChannelsState = StateType.init;


  @override
  void onInit() async{
    Get.find<Logger>().i("Start onInit YoutubeChannelsController");
    super.onInit();
    await getYoutubeChannels();
    Get.find<Logger>().w("End onInit YoutubeChannelsController");
  }


Future<void> getYoutubeChannels() async{
Get.find<Logger>()
        .i("Start `getYoutubeChannels` in |YoutubeChannelsController|");
    getYoutubeChannelsState = StateType.loading;
    update();
    GetYoutubeChannelsUseCase getYoutubeChannelsUseCase =
        GetYoutubeChannelsUseCase(Get.find());
    var result = await getYoutubeChannelsUseCase();

    result.fold(
      (l) async {
        getYoutubeChannelsState = getStateFromFailure(l);
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        getYoutubeChannelsState = StateType.init;
      },
      (r) {
        getYoutubeChannelsState = StateType.success;
        youtube_model = r;
        update();
      },
    );
    Get.find<Logger>().w(
        "End `getYoutubeChannels` in |YoutubeChannelsController| $getYoutubeChannelsState");

}

}
