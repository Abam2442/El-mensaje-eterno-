// ignore_for_file: public_member_api_docs, sort_constructors_first
class FixedEntities {
  String name;
  String content;
  FixedEntities({
    required this.name,
    required this.content,
  });
}

class CategoryFixedEntity {
  String category;
  List<FixedEntities> data;
  CategoryFixedEntity({
    required this.category,
    required this.data,
  });
}
