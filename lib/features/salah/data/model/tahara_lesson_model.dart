class TaharaLessonModel {
  final String title;
  final List<LessonDetail> lessonDetail;

  const TaharaLessonModel({required this.title, required this.lessonDetail});

  static TaharaLessonModel fromjson(json) => TaharaLessonModel(
      title: json['title'] ?? '',
      lessonDetail: json['lessons']
          .map<LessonDetail>((x) => LessonDetail.fromJson(x))
          .toList());
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
      return LessonDetail(
          title: json['title'],
          video: json['video'],
          body: json['body'].split('.'));
    } else {
      return LessonDetail(title: '', video: '', body: []);
    }
  }
}

// class TaharaLessonFromJson {
//   static Future<List<TaharaLessonModel>> getData() async {
//     // String data = await rootBundle.loadString('assets/json/Drossalaa.json');
//     // final body;
//     // try {
//     //   body = await json.decode(data)['Muslim '];
//     // } catch (e) {
//     //   print('e ${e.toString()}');
//     //   return [];
//     // }
//     // List<TaharaLessonModel> d =
//     //     await body.map<TaharaLessonModel>(TaharaLessonModel.fromjson).toList();
//     // print('d.lengh ${d.length}');
//     // return d;

//     SalahUseCase _salahUseCase = SalahUseCase(Get);
//   }
// }
