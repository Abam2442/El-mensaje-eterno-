
class PilersModel {
  PilersModel({
      List<Courses>? courses,}){
    _courses = courses;
}

  PilersModel.fromJson(dynamic json) {
    if (json['courses'] != null) {
      _courses = [];
      json['courses'].forEach((v) {
        _courses?.add(Courses.fromJson(v));
      });
    }
  }
  List<Courses>? _courses;
PilersModel copyWith({  List<Courses>? courses,
}) => PilersModel(  courses: courses ?? _courses,
);
  List<Courses>? get courses => _courses;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_courses != null) {
      map['courses'] = _courses?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Courses {
  Courses({
      String? title, 
      List<Lessons>? lessons,}){
    _title = title;
    _lessons = lessons;
}

  Courses.fromJson(dynamic json) {
    _title = json['title'];
    if (json['lessons'] != null) {
      _lessons = [];
      json['lessons'].forEach((v) {
        _lessons?.add(Lessons.fromJson(v));
      });
    }
  }
  String? _title;
  List<Lessons>? _lessons;
Courses copyWith({  String? title,
  List<Lessons>? lessons,
}) => Courses(  title: title ?? _title,
  lessons: lessons ?? _lessons,
);
  String? get title => _title;
  List<Lessons>? get lessons => _lessons;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    if (_lessons != null) {
      map['lessons'] = _lessons?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
class Lessons {
  Lessons({
      String? title, 
      String? video, 
      String? body,}){
    _title = title;
    _video = video;
    _body = body;
}

  Lessons.fromJson(dynamic json) {
    _title = json['title'];
    _video = json['video'];
    _body = json['body'];
  }
  String? _title;
  String? _video;
  String? _body;
Lessons copyWith({  String? title,
  String? video,
  String? body,
}) => Lessons(  title: title ?? _title,
  video: video ?? _video,
  body: body ?? _body,
);
  String? get title => _title;
  String? get video => _video;
  String? get body => _body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['video'] = _video;
    map['body'] = _body;
    return map;
  }

}