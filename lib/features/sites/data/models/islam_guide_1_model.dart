class IslamGuide1 {
  List<Chapter0> chapters;

  IslamGuide1({
    required this.chapters,
  });
}

class Chapter0 {
  String title;
  String paragraphs;

  Chapter0({
    required this.title,
    required this.paragraphs,
  });

  factory Chapter0.fromJson(Map<String, dynamic> json) => Chapter0(
        title: json["Title"],
        paragraphs: json["Paragraphs"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Paragraphs": paragraphs,
      };
}
