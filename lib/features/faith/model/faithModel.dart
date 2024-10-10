class FaithModel {
  FaithModel({
      List<Courses>? courses,}){
    _courses = courses;
}

  FaithModel.fromJson(dynamic json) {
    if (json['courses'] != null) {
      _courses = [];
      json['courses'].forEach((v) {
        _courses?.add(Courses.fromJson(v));
      });
    }
  }
  List<Courses>? _courses;
FaithModel copyWith({  List<Courses>? courses,
}) => FaithModel(  courses: courses ?? _courses,
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
      String? description, 
      List<Lessons>? lessons,}){
    _title = title;
    _description = description;
    _lessons = lessons;
}

  Courses.fromJson(dynamic json) {
    _title = json['title'];
    _description = json['description'];
    if (json['lessons'] != null) {
      _lessons = [];
      json['lessons'].forEach((v) {
        _lessons?.add(Lessons.fromJson(v));
      });
    }
  }
  String? _title;
  String? _description;
  List<Lessons>? _lessons;
Courses copyWith({  String? title,
  String? description,
  List<Lessons>? lessons,
}) => Courses(  title: title ?? _title,
  description: description ?? _description,
  lessons: lessons ?? _lessons,
);
  String? get title => _title;
  String? get description => _description;
  List<Lessons>? get lessons => _lessons;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['description'] = _description;
    if (_lessons != null) {
      map['lessons'] = _lessons?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
class Lessons {
  Lessons({
      String? title, 
      String? body,}){
    _title = title;
    _body = body;
}

  Lessons.fromJson(dynamic json) {
    _title = json['title'];
    _body = json['body'];
  }
  String? _title;
  String? _body;
Lessons copyWith({  String? title,
  String? body,
}) => Lessons(  title: title ?? _title,
  body: body ?? _body,
);
  String? get title => _title;
  String? get body => _body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['body'] = _body;
    return map;
  }

}