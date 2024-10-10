// class SunnahHadithModel {
//   List<String> booksName;
//   Map sunnahHadithes;

//   SunnahHadithModel({
//     required this.booksName,
//     required this.sunnahHadithes,
//   });

//   factory SunnahHadithModel.fromJson(Map<String, dynamic> json) {
//     return SunnahHadithModel(
//       booksName: json.keys.toList(),
//       sunnahHadithes: json,
//     );
//   }
// }

class SunnahHadithModel {
  Map<String, dynamic> hadiths;
  String bookName;

  SunnahHadithModel({required this.hadiths, required this.bookName});

  factory SunnahHadithModel.fromJson(
      Map<String, dynamic> hadiths, String bookName) {
    return SunnahHadithModel(hadiths: hadiths, bookName: bookName);
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
