import 'package:hiwayda_oracion_islamica/core/ys_localizations/ys_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SevedLanguageCode {
  late SharedPreferences sharedPreferences;

  Future<void> setSavedLanguageCode(String languageCode) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('language_code', languageCode);
  }

  Future<String> getSavedLanguageCode() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final savedLanguageCode = sharedPreferences.getString('language_code');
    if (savedLanguageCode != null) {
      return savedLanguageCode;
    } else {
      return YsLocalizations.defaultLanguageCode;
    }
  }
}
