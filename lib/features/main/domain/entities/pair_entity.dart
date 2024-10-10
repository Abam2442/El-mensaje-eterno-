

import '../../data/model/pair_model.dart';

class Pair {
  final int id;
  final String name;

  const Pair({
    required this.id,
    required this.name,
  });

  PairModel toModel() {
    return PairModel(
      id: id,
      name: name,
    );
  }
}
