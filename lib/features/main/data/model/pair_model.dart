

import '../../domain/entities/pair_entity.dart';

class PairModel extends Pair {
  const PairModel({
    required super.id,
    required super.name,
  });

  factory PairModel.fromJson(Map<String, dynamic> json) {
    return PairModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
