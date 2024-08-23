import '../../data/models/azkar_model/zikr.dart';

class Azkar {
  final int? categoryID;
  final String? categoryNameAr;
  final String? categoryNameEs;
  final List<ZikrModel>? zikr;

  const Azkar({
    this.categoryID,
    this.categoryNameAr,
    this.categoryNameEs,
    this.zikr,
  });
}
