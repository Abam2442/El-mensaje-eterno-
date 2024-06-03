import 'package:hiwayda_oracion_islamica/features/quran/domain/entities/ayah_entity.dart';

class AyahModel extends Ayah {
  const AyahModel({
    required super.arabic,
    required super.julioCortes,
    required super.raulGonzalezBornez,
    required super.muhammadIsaGarcia,
    required super.elMokhtasarTafsir,
    required super.noorinternationallatin,
    required super.noorinternationaleu,
    required super.arabic_search,
  });

  factory AyahModel.fromJson(Map<String, dynamic> json) {
    return AyahModel(
      arabic: json['arabic'],
      julioCortes: json['Julio Cortes'],
      raulGonzalezBornez: json['Raul Gonzalez Bornez'],
      muhammadIsaGarcia: json['Muhammad Isa Garcia'],
      elMokhtasarTafsir: json['El-Mokhtasar Tafsir'],
      noorinternationallatin: json['Noor international (Latin)'],
      noorinternationaleu: json['Noor international (EU)'],
      arabic_search: json['arabic_search'],
    );
  }
}
