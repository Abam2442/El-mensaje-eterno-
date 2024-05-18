
import 'dart:core';

class KidsModel {
  KidsModel({
    List<Lessons>? lessons,}){
    _lessons =lessons;
  }
  KidsModel.fromJson(dynamic json) {
    if (json['lessons'] != null) {
      _lessons = [];
      json['lessons'].forEach((v) {
        _lessons?.add(Lessons.fromJson(v));
      });
    }
  }
  List<Lessons>? _lessons;
  KidsModel copyWith({  List<Lessons>? lessons,
  }) => KidsModel(  lessons: lessons ?? _lessons,
  );
  List<Lessons>? get lessons => _lessons;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_lessons != null) {
      map['Lessons'] = _lessons?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Lessons {
  Lessons({
    String? title,
    List<Content>? content,}){
    _title = title;
    _content =content;
  }

Lessons.fromJson(dynamic json) {
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
  Lessons copyWith({  String? title,
    List<Content>? content,
  }) => Lessons(  title: title ?? _title,
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
    }){
    question = question;
    _answer = answer;

  }

  Content.fromJson(dynamic json) {

    _question = json['question'];
    _answer= json['answer'];

  }
  String? _question;
  String? _answer;

  Content copyWith({  String? question,
    String? answer,

  }) => Content(  question: question ?? _question,
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