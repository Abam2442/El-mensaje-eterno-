class Islamqa {
  String name;
  String description;
  List<Question> questions;
  List<IslamqaSubTopic>? subTopics;

  Islamqa({
    required this.name,
    required this.description,
    required this.questions,
    required this.subTopics,
  });

  factory Islamqa.fromJson(Map<String, dynamic> json) => Islamqa(
        name: json["name"],
        description: json["description"],
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
        subTopics: json["subTopics"] == null
            ? []
            : List<IslamqaSubTopic>.from(
                json["subTopics"]!.map((x) => IslamqaSubTopic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
        "subTopics": subTopics == null
            ? []
            : List<dynamic>.from(subTopics!.map((x) => x.toJson())),
      };
}

class Question {
  String questionText;
  String? shortAnswer;
  String answer;

  Question({
    required this.questionText,
    required this.shortAnswer,
    required this.answer,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        questionText: json["questionText"],
        shortAnswer: json["shortAnswer"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "questionText": questionText,
        "shortAnswer": shortAnswer,
        "answer": answer,
      };
}

class IslamqaSubTopic {
  String name;
  String description;
  List<Question> questions;
  List<PurpleSubTopic>? subTopics;

  IslamqaSubTopic({
    required this.name,
    required this.description,
    required this.questions,
    required this.subTopics,
  });

  factory IslamqaSubTopic.fromJson(Map<String, dynamic> json) =>
      IslamqaSubTopic(
        name: json["name"],
        description: json["description"],
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
        subTopics: json["subTopics"] == null
            ? []
            : List<PurpleSubTopic>.from(
                json["subTopics"]!.map((x) => PurpleSubTopic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
        "subTopics": subTopics == null
            ? []
            : List<dynamic>.from(subTopics!.map((x) => x.toJson())),
      };
}

class PurpleSubTopic {
  String name;
  String description;
  List<Question> questions;
  List<FluffySubTopic>? subTopics;

  PurpleSubTopic({
    required this.name,
    required this.description,
    required this.questions,
    required this.subTopics,
  });

  factory PurpleSubTopic.fromJson(Map<String, dynamic> json) => PurpleSubTopic(
        name: json["name"],
        description: json["description"],
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
        subTopics: json["subTopics"] == null
            ? []
            : List<FluffySubTopic>.from(
                json["subTopics"]!.map((x) => FluffySubTopic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
        "subTopics": subTopics == null
            ? []
            : List<dynamic>.from(subTopics!.map((x) => x.toJson())),
      };
}

class FluffySubTopic {
  String name;
  String description;
  List<Question> questions;
  List<FluffySubTopic>? subTopics;

  FluffySubTopic({
    required this.name,
    required this.description,
    required this.questions,
    this.subTopics,
  });

  factory FluffySubTopic.fromJson(Map<String, dynamic> json) => FluffySubTopic(
        name: json["name"],
        description: json["description"],
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
        subTopics: json["subTopics"] == null
            ? []
            : List<FluffySubTopic>.from(
                json["subTopics"]!.map((x) => FluffySubTopic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
        "subTopics": subTopics == null
            ? []
            : List<dynamic>.from(subTopics!.map((x) => x.toJson())),
      };
}
