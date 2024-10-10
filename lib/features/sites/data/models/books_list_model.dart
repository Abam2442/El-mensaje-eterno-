import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';

class IslamMessageBookModel extends MediaCategoryEntity {
  IslamMessageBookModel({required super.category, required super.data});
  factory IslamMessageBookModel.fromJson(Map<String, dynamic> json) {
    List<MediaEntity> books = [];
    if (json["books"] is List && json["books"].isNotEmpty) {
      for (var bookJson in (json["books"] as List)) {
        var book = MediaEntity(
          name: bookJson['title'],
          url: bookJson['link'],
        );
        books.add(book);
      }
    }
    return IslamMessageBookModel(category: json['name'], data: books);
  }
}
