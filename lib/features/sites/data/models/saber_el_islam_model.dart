// ignore_for_file: public_member_api_docs, sort_constructors_first
class SaberElIslamModel {
  String link;
  String name;
  List<SEIArtical> articals;
  SaberElIslamModel({
    required this.link,
    required this.name,
    required this.articals,
  });
}

class SEIArtical {
  String title;
  String link;
  String artical;
  SEIArtical({
    required this.title,
    required this.link,
    required this.artical,
  });
}
