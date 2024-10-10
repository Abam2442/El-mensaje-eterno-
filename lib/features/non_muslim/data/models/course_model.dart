class NonMuslimModel {
  String sectionName;
  String sectionType;
  List<IslamTopic> topics;

  NonMuslimModel({
    required this.sectionName,
    required this.sectionType,
    required this.topics,
  });

  factory NonMuslimModel.fromJson(Map<String, dynamic> json) {
    List<IslamTopic> topics = [];
    if (json['topics'] != null) {
      for (var topic in json['topics']) {
        topics.add(IslamTopic.fromJson(topic));
      }
    }

    return NonMuslimModel(
      sectionName: json['sectionName'],
      sectionType: json['sectionType'],
      topics: topics,
    );
  }
}

class IslamTopic {
  String header;
  List<IslamNestedTopic> nestedTopics;

  IslamTopic({
    required this.header,
    required this.nestedTopics,
  });

  factory IslamTopic.fromJson(Map<String, dynamic> json) {
    List<IslamNestedTopic> nestedTopics = [];
    if (json['nestedTopics'] != null) {
      for (var nestedTopic in json['nestedTopics']) {
        nestedTopics.add(IslamNestedTopic.fromJson(nestedTopic));
      }
    }

    return IslamTopic(
      header: json['header'],
      nestedTopics: nestedTopics,
    );
  }
}

class IslamNestedTopic {
  String title;
  String body;

  IslamNestedTopic({
    required this.title,
    required this.body,
  });

  factory IslamNestedTopic.fromJson(Map<String, dynamic> json) {
    return IslamNestedTopic(
      title: json['title'],
      body: json['body'],
    );
  }
}
