class KidsModel {
  KidsModel({
    List<Title>? titles,
  }) {
    _titles = titles;
  }

  KidsModel.fromJson(dynamic json) {
    if (json != null) {
      _titles = [];
      json.forEach((v) {
        _titles?.add(Title.fromJson(v));
      });
    }
  }

  List<Title>? _titles;

  KidsModel copyWith({
    List<Title>? titles,
  }) =>
      KidsModel(
        titles: titles ?? _titles,
      );

  List<Title>? get titles => _titles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_titles != null) {
      map['titles'] = _titles?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Title {
  Title({
    String? title,
    List<Content>? content,
  }) {
    _title = title;
    _content = content;
  }

  Title.fromJson(dynamic json) {
    _title = json['title'];
    if (json['content'] != null) {
      _content = [];
      json['content'].forEach((v) {
        _content?.add(Content.fromJson(v));
      });
    }
  }

  String? _title;
  List<Content>? _content;

  Title copyWith({
    String? title,
    List<Content>? content,
  }) =>
      Title(
        title: title ?? _title,
        content: content ?? _content,
      );

  String? get title => _title;
  List<Content>? get content => _content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    if (_content != null) {
      map['content'] = _content?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Content {
  Content({
    String? question,
    String? answer,
  }) {
    _question = question;
    _answer = answer;
  }

  Content.fromJson(dynamic json) {
    _question = json['question'];
    _answer = json['answer'];
  }

  String? _question;
  String? _answer;

  Content copyWith({
    String? question,
    String? answer,
  }) =>
      Content(
        question: question ?? _question,
        answer: answer ?? _answer,
      );

  String? get question => _question;
  String? get answer => _answer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['question'] = _question;
    map['answer'] = _answer;
    return map;
  }
}
