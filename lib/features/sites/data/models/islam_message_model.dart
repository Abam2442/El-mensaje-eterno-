import '../../domain/entities/islam_message_entities.dart';

class IslamMessageArticalModel extends IslamMessageArticalEntities {
  const IslamMessageArticalModel({
    required super.name,
    required super.subCatigory,
  });
  factory IslamMessageArticalModel.fromJson(Map<String, dynamic> json) {
    List<SubCatigoryArticalModel> subCatigory = [];
    if (json['articles'] != null) {
      for (var subcatigory in json['articles']) {
        subCatigory.add(SubCatigoryArticalModel.fromJson(subcatigory));
      }
    }

    return IslamMessageArticalModel(
        name: json['name'], subCatigory: subCatigory);
  }
}

class SubCatigoryArticalModel extends SubArticalEntities {
  SubCatigoryArticalModel({
    required super.subArticalName,
    required super.bodyArtical,
  });

  factory SubCatigoryArticalModel.fromJson(Map<String, dynamic> json) {
    return SubCatigoryArticalModel(
        bodyArtical: json['body'], subArticalName: json['title']);
  }
}

class IslamMessageBookModel extends IslamMessageBookEntities {
  const IslamMessageBookModel({
    required super.name,
    required super.subCatigory,
  });
  factory IslamMessageBookModel.fromJson(Map<String, dynamic> json) {
    List<SubCatigoryBookModel> subCatigory = [];
    if (json['books'] != null) {
      for (var subcatigory in json['books']) {
        subCatigory.add(SubCatigoryBookModel.fromJson(subcatigory));
      }
    }

    return IslamMessageBookModel(name: json['name'], subCatigory: subCatigory);
  }
}

class SubCatigoryBookModel extends SubBookEntities {
  SubCatigoryBookModel({required super.subBookName, required super.bodyBook});

  factory SubCatigoryBookModel.fromJson(Map<String, dynamic> json) {
    return SubCatigoryBookModel(
        bodyBook: json['link'], subBookName: json['title']);
  }
}

class IslamMessageAudioModel extends IslamMessageAudioEntities {
  const IslamMessageAudioModel({
    required super.name,
    required super.link,
  });
  factory IslamMessageAudioModel.fromJson(Map<String, dynamic> json) {
    return IslamMessageAudioModel(link: json['link'], name: json['title']);
  }
}
