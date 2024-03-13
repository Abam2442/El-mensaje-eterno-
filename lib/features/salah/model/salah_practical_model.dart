import 'dart:convert';
import 'package:flutter/material.dart';

class SalahPracticalModel{
  final String rakaa;
  final String stepName;
  final String image;
  final String? image2;
  final String? image3;
  final String? image4;
  final String? image5;
  final String? image6;
  final String video;
  final String video2;
  final String description;
  final String descriptionaudio;
  final List<Topic> topics;


  SalahPracticalModel(
      {
        required this.rakaa,
        required this.stepName,
        required this.image,
        this.image2,
        this.image3,
        this.image4,
        this.image5,
        this.image6,
        required this.video,
        required this.video2,
        required this.description,
        required this.descriptionaudio,
        required this.topics
        });
  static SalahPracticalModel fromJson(json){
    return SalahPracticalModel(
      rakaa: json['Rakaa'] ?? '',
      stepName: json['StepName'] ?? '',
      image: json['image'] ?? '',
        image2: json['image2'] ?? '',
        image3: json['image3'] ?? '',
        image4: json['image4'] ?? '',
        image5: json['image5'] ?? '',
        image6: json['image6'] ?? '',
      video: json['Video'] ?? '',
        video2: json['Video2'] ?? '',
      description: json['description']?? '',
      descriptionaudio: json['descriptionaudio']?? '',
      topics: json['topics'].map<Topic>((x) => Topic.fromJson(x)).toList()
    );
  }
}

class Topic{
  final String body;
  final String transliteration;
  final String audioTopic;
  final String videoTopic;
  final String translation;
  final String descriptiontopic;
  final String? descriptiontopicaudio;
  final String? fin;
  final String? finaudio;
  Topic({
    required this.body,
    required this.transliteration,
    required this.audioTopic,
    required this.videoTopic,
    required this.translation,
    required this.descriptiontopic,
    this.descriptiontopicaudio,
    this.fin,
    this.finaudio
});
  static Topic fromJson(json){
    return Topic(
      body: json['body'] ?? '',
      transliteration: json['transliteration'] ?? '',
      audioTopic: json['audio'] ?? '',
      videoTopic: json['Video'] ?? '',
      translation: json['translation'] ?? '',
      descriptiontopic: json['Descriptiontopic'] ?? '',
      descriptiontopicaudio: json['descriptiontopicaudio'],
      fin: json['Fin'],
      finaudio: json['Finaudio']
        );
  }
}

class SalahStepsFromJson {
  static Future<List<dynamic>> getData(BuildContext context,String salah) async{
    final assetBunlde = DefaultAssetBundle.of(context);
    String data = await  assetBunlde.loadString(salah);
    final body;
    try{
      body = await json.decode(data);
    }catch(e){
      print('error ${e.toString()}');
      return [];
    }
    return body;
  }
}