import 'package:hiwayda_oracion_islamica/features/quran/data/models/ayah_model.dart';
import 'package:hiwayda_oracion_islamica/features/quran/domain/entities/ayah_entity.dart';
import 'package:hiwayda_oracion_islamica/features/quran/domain/entities/surah_entity.dart';

class SurahModel extends Surah {
  const SurahModel({
    required super.name,
    required super.ayat,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) {
    return SurahModel(
      name: json['sora'],
      ayat: (json['ayat'] as List)
          .map<Ayah>(
            (ayah) => AyahModel.fromJson(ayah),
          )
          .toList(),
    );
  }
}
