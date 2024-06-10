import 'package:hiwayda_oracion_islamica/features/quran/domain/entities/ayah_entity.dart';

class AyahModel extends Ayah {
  const AyahModel({
    required super.arabic,
    required super.muhammadIsaGarcia,
    required super.elMokhtasarTafsir,
    required super.noorinternationallatin,
    required super.noorinternationaleu,
    required super.arabic_search,
    required super.abdelGhani,
    // required super.elmensaje,
    required super.mohamedMulla,
  });

  factory AyahModel.fromJson(Map<String, dynamic> json) {
    return AyahModel(
      arabic: json['arabic'],
      muhammadIsaGarcia: json['Muhammad Isa Garcia'],
      elMokhtasarTafsir: json['El-Mokhtasar Tafsir'],
      noorinternationallatin: json['Noor international (Latin)'],
      noorinternationaleu: json['Noor international (EU)'],
      arabic_search: json['arabic_search'],
      abdelGhani: json['Abdel-Ghani Melara - Complejo del Rey Fahd'],
      // elmensaje: json['EL MENSAJE DEL CORÁN -  Mohamed Asad'],
      mohamedMulla: json['Mohammed Bahige Mulla'],
    );
  }
}
