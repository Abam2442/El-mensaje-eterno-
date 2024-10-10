// ignore_for_file: public_member_api_docs, sort_constructors_first
class MediaEntity {
  String name;
  String url;
  MediaEntity({
    required this.name,
    required this.url,
  });
}

class MediaCategoryEntity {
  String category;
  List<MediaEntity> data;
  MediaCategoryEntity({
    required this.category,
    required this.data,
  });
}
