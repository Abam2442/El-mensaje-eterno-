import 'dart:convert';

import 'package:flutter/material.dart';

class WuduPracticalModel {
  final String header;
  final List<NestedTopics> topics;

  WuduPracticalModel({required this.header, required this.topics});

  static WuduPracticalModel fromJson(json) {
    return WuduPracticalModel(
        header: json['header'] ?? '',
        topics: json['nestedTopics'].map<NestedTopics>((x) => NestedTopics.fromJson(x)).toList());
  }
}

class NestedTopics {
  final String title;
  final String video;
  final String image;
  final String description;
  final String body;
  final String transliteration;
  final String audio;
  final String translation;

  NestedTopics(
      {required this.title,
      required this.image,
      required this.body,
      required this.transliteration,
      required this.audio,
      required this.video,
      required this.translation,
      required this.description});

  static NestedTopics fromJson(json) {
    return NestedTopics(
        title: json['title'],
        body: json['body'] ?? '',
        transliteration: json['Transliteration'] ?? '',
        audio: json['Audio'] ?? '',
        video: json['video'] ?? '',
        translation: json['Translation'] ?? '',
        description: json['Description'] ?? '',
        image: json['Image'] ?? '');
  }
}

class WuduStepsFromJson {
  static Future<WuduPracticalModel> getData(BuildContext context, String jsonFile) async {
    final assetBunlde = DefaultAssetBundle.of(context);
    String data = await assetBunlde.loadString(jsonFile);
    final body;
    try {
      body = await json.decode(data)['Salah'];
      print(body);
    } catch (e) {
      print('error ${e.toString()}');
      return WuduPracticalModel(topics: [], header: '');
    }
    WuduPracticalModel d = WuduPracticalModel(
        header: body[0]['header'],
        topics: body[0]['nestedTopics'].map<NestedTopics>((x) => NestedTopics.fromJson(x)).toList());
    //print('d ${d.length}');
    return d;
  }
}
