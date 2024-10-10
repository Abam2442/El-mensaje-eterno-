import 'package:adhan_dart/adhan_dart.dart';
import 'package:just_audio/just_audio.dart';
//import 'package:assets_audio_player/assets_audio_player.dart';


import '../../features/salah/model/tahara_lesson_model.dart';

class AppPublicVar{
  static AudioPlayer assetsAudioPlayer = AudioPlayer();
  static Coordinates? coordinates;
  static late List<TaharaLessonModel> taharaLessons;
}