import 'package:hiwayda_oracion_islamica/core/services/api_service.dart';

abstract class AyatAudioRemoteDataSource {
  Future<List<String>> getAudio(
      {required int readerId, required int chapterNumber});
}

class AyatAudioRemoteDataSourceImpl extends AyatAudioRemoteDataSource {
  final ApiService apiService;

  AyatAudioRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<String>> getAudio(
      {required int readerId, required int chapterNumber}) async {
    Map<String, dynamic> mapData = await apiService.get(
      subUrl:
          'https://api.quran.com/api/v4/recitations/$readerId/by_chapter/$chapterNumber',
      parameters: {},
    );
    final List<String> ayat = mapData['audio_files']
        .map<String>(
          (item) => item['url'],
        )
        .toList();
    return ayat;
  }
}
