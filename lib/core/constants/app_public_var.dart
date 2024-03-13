import 'package:adhan_dart/adhan_dart.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

import '../../features/salah/model/tahara_lesson_model.dart';

class AppPublicVar{
  static AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  static Coordinates? coordinates;
  static late List<TaharaLessonModel> taharaLessons;
}