import 'package:hiwayda_oracion_islamica/features/azkar_doaa/domain/entities/azkar_entity.dart';

import 'zikr.dart';

class AzkarModel extends Azkar {
  const AzkarModel({
    required super.categoryID,
    required super.categoryNameAr,
    required super.categoryNameEs,
    required super.zikr,
  });
  factory AzkarModel.fromJson(Map<String, dynamic> json) {
    return AzkarModel(
      categoryID: json['CategoryID'],
      categoryNameAr: json['CategoryName_Ar'],
      categoryNameEs: json['CategoryName_Es'],
      zikr: json['Zikr'] == null
          ? null
          : List<ZikrModel>.from(
              json['Zikr'].map((x) => ZikrModel.fromJson(x))),
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CategoryID'] = categoryID;
    data['CategoryName_Ar'] = categoryNameAr;
    data['CategoryName_Es'] = categoryNameEs;
    if (zikr != null) {
      data['Zikr'] = zikr!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
