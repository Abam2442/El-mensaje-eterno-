import 'package:hiwayda_oracion_islamica/features/quran/domain/entities/ayah_entity.dart';

class AyahModel extends Ayah {
  const AyahModel({
    required super.arabic,
    required super.arabic_search,
    required super.tafsirs
   
  
  });

  factory AyahModel.fromJson(Map<String, dynamic> json) {
    return AyahModel(
      arabic: json['arabic']!,
      arabic_search: json['arabic_search']?? '',
      tafsirs: json
      
    );
  }
}
