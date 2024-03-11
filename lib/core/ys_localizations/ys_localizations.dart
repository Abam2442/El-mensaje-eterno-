import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class YsLocalizations {
  static YsLocalizations? _instance;

  YsLocalizations._();

  static YsLocalizations get instance => _instance ?? YsLocalizations._();

  static Locale? _locale;

  static Locale get locale => _locale!;

  static init() async {
    languagesCode = supportedLanguagesCode;
    transSourceType = translateSourceType;
    defaultLangCode = defaultLanguageCode;
    supportedCountryCode =
        supportedCountryCode.length == supportedLanguagesCode.length
            ? supportedCountryCode
            : List.generate(supportedLanguagesCode.length, (index) {
                return index >= supportedCountryCode.length
                    ? ''
                    : supportedCountryCode[index];
              });
    await setLocale(Locale(defaultLangCode));
  }

// Init
  static String defaultLanguageCode = 'en';
  static String translateSourceType = 'asset'; //map - asset
  static List<String> supportedLanguagesCode = const ['en', 'ar'];
  static List<String> supportedCountryCode = [];

  static late List<String> languagesCode;
  static late String transSourceType;
  static late String defaultLangCode;

  static List<Locale> get supportedLocale {
    return List.generate(
      supportedLanguagesCode.length,
      (index) => Locale(
        supportedLanguagesCode[index],
        supportedCountryCode[index],
      ),
    );
  }

  static Iterable<LocalizationsDelegate<dynamic>> get localizationsDelegates =>
      [
        YsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  static Locale? Function(Locale?, Iterable<Locale>)? localeResolutionCallback =
      (deviceLocale, supportedLocales) {
    for (var locale in supportedLocales) {
      if (deviceLocale != null &&
          deviceLocale.languageCode == locale.languageCode) {
        return deviceLocale;
      }
    }
    return supportedLocales.first;
  };
  //
  static Future<void> setLocale(Locale locale) async {
    _locale = locale;
    await YsLocalizations.loadTranslateLanguages();
  }

  static const LocalizationsDelegate<YsLocalizations> delegate =
      _LocalizationsDelegate();

  static List<String> ysLanguagesCode = YsLocalizations.languagesCode;

  static late Map<String, String> ylocalizedstringAsset;
  static late Map<String, String> ylocalizedstringMap;

  static Future loadTranslateLanguages() async {
    if (YsLocalizations.transSourceType == 'map') {
      log('Loading map languages...');
      YsLocalizations.instance.loadMapLanguages();
    } else if (YsLocalizations.transSourceType == 'asset') {
      log('Loading JSON languages...');
      await YsLocalizations.instance.loadJsonLanguages();
    } else {
      log('No translation source specified.');
    }
  }

  Future loadJsonLanguages() async {
    log('Loading JSON file for language code: ${locale.languageCode}');
    String jsonString =
        await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    ylocalizedstringAsset = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    if (ylocalizedstringAsset.isEmpty &&
        locale.languageCode != defaultLangCode) {
      log('Translations not found for ${locale.languageCode}, using default language code: $defaultLangCode');
      YsLocalizations.setLocale(Locale(defaultLangCode));
    }
  }

  loadMapLanguages() {
    // log('Loading map for language code: ${locale.languageCode}');
    // Map<String, dynamic>? trans = Translation.translaion[locale.languageCode];
    // ylocalizedstringMap = trans!.map((key, value) {
    //   return MapEntry(key, value.toString());
    // });
    // // log(ylocalizedstringMap.toString());
    // if (ylocalizedstringMap.isEmpty && locale.languageCode != defaultLangCode) {
    //   log('Translations not found for ${locale.languageCode}, using default language code: $defaultLangCode');
    //   YsLocalizations.setLocale(Locale(defaultLangCode));
    // }
  }

  static String? translate(String key) {
    if (YsLocalizations.transSourceType == 'map') {
      return ylocalizedstringMap[key] ?? '';
    } else if (YsLocalizations.transSourceType == 'asset') {
      return ylocalizedstringAsset[key] ?? '';
    } else {
      return '';
    }
  }
}

class _LocalizationsDelegate extends LocalizationsDelegate<YsLocalizations> {
  const _LocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return YsLocalizations.ysLanguagesCode.contains(locale.languageCode);
  }

  @override
  Future<YsLocalizations> load(Locale locale) async {
    YsLocalizations.setLocale(locale);
    return YsLocalizations.instance;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<YsLocalizations> old) =>
      false;
}

extension TranslateX on String {
  String get tr {
    return YsLocalizations.translate(this) ?? '';
  }
}
