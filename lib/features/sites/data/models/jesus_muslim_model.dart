import '../../domain/entities/jesus_muslim_entities.dart';

class JesusMuslimModel extends JesusMuslimEntities {
  JesusMuslimModel({
    required super.name,
    required super.content,
    required super.imageLink,
  });
  factory JesusMuslimModel.fromJson(Map<dynamic, dynamic> json) {
    return JesusMuslimModel(
        name: json['title'],
        content: json['blog_text'],
        imageLink: json['img_link']);
  }
}
