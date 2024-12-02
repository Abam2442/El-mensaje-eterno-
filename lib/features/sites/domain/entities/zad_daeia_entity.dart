import 'package:hiwayda_oracion_islamica/features/non_muslim/data/models/course_model.dart';

class ZadDaeiaEntity {
  final String sectionName;
  final String sectionType;
  final List<IslamTopic> topics;
  final List<IslamNestedTopic> nestedTopics;

  ZadDaeiaEntity({
    required this.sectionName,
    required this.sectionType,
    this.topics = const [],
    this.nestedTopics = const [],
  });

  factory ZadDaeiaEntity.fromJson(Map<String, dynamic> json) {
    final topics = (json['topics'] as List<dynamic>? ?? [])
        .map((topic) {
          if (topic is Map<String, dynamic> &&
              topic.containsKey('header') &&
              topic.containsKey('nestedTopics')) {
            return IslamTopic.fromJson(topic);
          }
          return null; // for other cases
        })
        .whereType<IslamTopic>()
        .toList();

    final nested = (json['topics'] as List<dynamic>? ?? [])
        .where((topic) =>
            topic is Map<String, dynamic> &&
            !topic.containsKey('header') &&
            !topic.containsKey('nestedTopics'))
        .expand((topic) => (topic as Map<String, dynamic>).entries)
        .map((entry) => {"title": entry.key, "body": entry.value})
        .toList();

    return ZadDaeiaEntity(
      sectionName: json['sectionName'] ?? '',
      sectionType: json['sectionType'] ?? '',
      topics: topics,
      nestedTopics: nested
          .map((nestedTopic) => IslamNestedTopic.fromJson(nestedTopic))
          .toList(),
    );
  }
}
