class TestModel {
  final String hijriDate;
  final Map<String, dynamic> timings;

  TestModel({required this.hijriDate, required this.timings});

  factory TestModel.fromJson(Map<String, dynamic> json) {
    return TestModel(
        hijriDate: json['data']['date']['hijri']['date'],
        timings: json['data']['timings']);
  }
}
