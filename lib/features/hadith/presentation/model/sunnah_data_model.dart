import 'package:dartz/dartz.dart';

class SunnahDataModel {
  final String head, explain;
  final Either<String, List> data;

  SunnahDataModel(
      {required this.head, required this.data, required this.explain});

  factory SunnahDataModel.fromjson(json) {
    bool isString = json['Data'] is String;
    return SunnahDataModel(
      head: json['Head'] ?? json['Header'],
      data: isString ? Left(json['Data']) : Right(json['Data']),
      explain: json['Explain'] ?? '',
    );
  }
}
