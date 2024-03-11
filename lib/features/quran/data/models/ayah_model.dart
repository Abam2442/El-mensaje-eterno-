import 'package:hiwayda_oracion_islamica/features/quran/domain/entities/ayah_entity.dart';

class AyahModel extends Ayah {
  const AyahModel({
    required super.arabic,
    required super.julioCortes,
    required super.raulGonzalezBornez,
    required super.muhammadIsaGarcia,
  });

  factory AyahModel.fromJson(Map<String, dynamic> json) {
    return AyahModel(
      arabic: json['arabic'],
      julioCortes: json['julio_cortes'],
      raulGonzalezBornez: json['raul_gonzalez_bornez'],
      muhammadIsaGarcia: json['muhammad_isa_garcia'],
    );
  }
}
