// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../domain/entities/fixed_entities.dart';

class KnowingAllahModel {
  List<KnowingAllahSubCategoryModel> videos;
  List<KnowingAllahSubCategoryModel> audios;
  List<KnowingAllahSubCategoryModel> books;
  List<KnowingAllahSubCategoryModel> articles;
  KnowingAllahModel({
    required this.videos,
    required this.audios,
    required this.books,
    required this.articles,
  });
}

class KnowingAllahSubCategoryModel {
  String name;
  List<FixedEntities> subcategories;
  KnowingAllahSubCategoryModel({
    required this.name,
    required this.subcategories,
  });
}
