class ZikrModel {
  final int? zikrId;
  final int? repeatNumber;
  final String? arabic;
  final String? espaniol;

  ZikrModel({
    this.zikrId,
    this.repeatNumber,
    this.arabic,
    this.espaniol,
  });
  factory ZikrModel.fromJson(Map<String, dynamic> json) {
    return ZikrModel(
      zikrId: json['ZirkID'],
      repeatNumber: json['Repeat number'],
      arabic: json['Arabic'],
      espaniol: json['Espaniol'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'ZirkID': zikrId,
      'Repeat number': repeatNumber,
      'Arabic': arabic,
      'Espaniol': espaniol,
    };
  }
}
