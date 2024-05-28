import 'dart:async';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // For using json.decode

import '../../data/models/reader_model.dart';

class TelawaController extends GetxController {
  List<ReaderModel> readers = [
    ReaderModel(2, 'AbdulBaset AbdulSamad'),
    ReaderModel(12, 'Mahmoud Khalil Al-Husary'),
    ReaderModel(7, 'Mishari Rashid al-`Afasy'),
    ReaderModel(9, 'Mohamed Siddiq al-Minshawi'),
    ReaderModel(10, 'Sa`ud ash-Shuraym'),
  ];

  ReaderModel selectedReader = ReaderModel(2, 'AbdulBaset AbdulSamad');

  updateSelectedReader(ReaderModel reader) {
    selectedReader.updateData(reader);
    update();
  }

  List<String> audioUrls = [];

  Future<void> getAyatAudio(int chapterNumber) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.quran.com/api/v4/recitations/${selectedReader.id}/by_chapter/$chapterNumber'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<String> ayat = data['audio_files']
            .map(
              (item) => item['url'] as String,
            )
            .toList()
            .cast<String>();
        audioUrls.clear();
        audioUrls.addAll(ayat);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
    update();
  }
}