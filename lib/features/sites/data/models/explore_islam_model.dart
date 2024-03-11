import '../../domain/entities/fixed_entities.dart';

class ExploreIslamModel extends FixedEntities {
  ExploreIslamModel({
    required super.name,
    required super.content,
  });
  factory ExploreIslamModel.fromJson(Map<dynamic, dynamic> json) {
    return ExploreIslamModel(
      name: json['Title'],
      content: json['content'],
    );
  }
}
