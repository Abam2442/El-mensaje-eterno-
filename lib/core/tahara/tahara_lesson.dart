import 'dart:convert';

import 'package:flutter/services.dart';

class TaharaLesson {
  final String title;
  final List<LessonDetail> lessonDetail;

  const TaharaLesson({required this.title, required this.lessonDetail});

  static TaharaLesson fromjson(json) => TaharaLesson(
      title: json['title'] ?? '',
      lessonDetail: json['lessons'].map<LessonDetail>((x) => LessonDetail.fromJson(x)).toList());
}

class LessonDetail {
  final String title;
  final String video;
  final List<String> body;

  LessonDetail({required this.title, required this.video, required this.body});

  static LessonDetail fromJson(json) {
    if (json != null) {
      /* print(json['title']);
      List<String> aa = json['body'].split('.');
      print(aa.length);*/
      return LessonDetail(title: json['title'], video: json['video'], body: json['body'].split('.'));
    } else {
      return LessonDetail(title: '', video: '', body: []);
    }
  }
}

class TaharaLessonFromJson {
  static Future<List<TaharaLesson>> getData() async {
    String data = await rootBundle.loadString('assets/json/Drossalaa.json');
    final body;
    try {
      body = await json.decode(data)['Muslim '];
    } catch (e) {
      print('e ${e.toString()}');
      return [];
    }
    List<TaharaLesson> d = await body.map<TaharaLesson>(TaharaLesson.fromjson).toList();
    print('d.lengh ${d.length}');
    return d;
  }
}
