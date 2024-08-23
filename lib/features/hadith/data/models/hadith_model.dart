class SunnahHadithModel {
  List<String> booksName;
  Map sunnahHadithes;

  SunnahHadithModel({
    required this.booksName,
    required this.sunnahHadithes,
  });

  factory SunnahHadithModel.fromJson(Map<String, dynamic> json) {
    return SunnahHadithModel(
      booksName: json['Hadith']['la-sunnah'].keys.toList(),
      sunnahHadithes: json['Hadith']['la-sunnah'],
    );
  }
}

class HaditencHadithModel {
  List<String> categoriesName;
  Map hadithencHadithes;

  HaditencHadithModel({
    required this.categoriesName,
    required this.hadithencHadithes,
  });

  factory HaditencHadithModel.fromJson(Map<String, dynamic> json) {
    return HaditencHadithModel(
      categoriesName: json['Hadith']['hadithenc'].keys.toList(),
      hadithencHadithes: json['Hadith']['hadithenc'],
    );
  }
}
