import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:hiwayda_oracion_islamica/core/services/easy_loader_service.dart';

class AudioService extends GetxService {
  final AudioPlayer player = AudioPlayer();

  var isPlaying = false.obs;
  var isDownloading = false.obs;
  VoidCallback? onFinishedCallback;

  @override
  void onInit() {
    super.onInit();
    _setupPlayerListeners();
  }

  void _setupPlayerListeners() {
    player.processingStateStream.listen((processingState) {
      switch (processingState) {
        case ProcessingState.loading:
          _onStartDownloading();
          break;
        case ProcessingState.ready:
          _onSoundDownloaded();
          break;
        case ProcessingState.completed:
          _onFinishedPlaying();
          break;
        default:
          break;
      }
    });

    player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace st) {
      _onErrorDownloading();
    });
  }

  Future<void> setUrl(String url) async {
    await player.setUrl(url);
  }

  void play() {
    player.play();
    isPlaying.value = true;
  }

  void pause() {
    player.pause();
    isPlaying.value = false;
  }

  void stop() {
    player.stop();
    isPlaying.value = false;
  }

  @override
  void onClose() {
    player.dispose();
    super.onClose();
  }

  void _onStartDownloading() {
    isDownloading.value = true;
  }

  void _onSoundDownloaded() {
    isDownloading.value = false;
  }

  void _onErrorDownloading() {
    pause();
    EasyLoaderService.showToast(
        message: 'No se puede obtener el audio. Conéctese a Internet.');
  }

  void _onFinishedPlaying() {
    if (onFinishedCallback != null) {
      onFinishedCallback!();
    }
  }

  void setOnFinishedCallback(VoidCallback callback) {
    onFinishedCallback = callback;
  }
}
