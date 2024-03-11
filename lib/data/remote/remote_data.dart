import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/navigation_service.dart';
import 'package:hiwayda_oracion_islamica/core/ys_localizations/ys_localizations_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

export 'package:provider/provider.dart';

class RemoteData extends ChangeNotifier {
  final dio = Dio();
  final locale = YsLocalizationsProvider.listenFalse(NavigationService.currentContext);

  RemoteData() {
    init();
  }

  void init() {
    dio.options.baseUrl = baseUrl;
    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        error: true,
      ));
    }
  }

  Map<String, dynamic>? getHeaders({bool isAuth = true}) {
    Map<String, dynamic>? headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'lang': locale.languageCode,
      // if (LocalData.isLogined && isAuth)
      //   'Authorization': 'Bearer ${LocalData.token}'
    };

    return headers;
  }

  // !--------------------------------------------------------------------------
  // !--------------------------------------------------------------------------

  Future<Response<dynamic>> dioGet(String path, bool? isAuth) {
    try {
      return dio.get(
        path,
        options: Options(
          headers: getHeaders(isAuth: isAuth ?? true),
          responseType: ResponseType.json,
        ),
      );
    } catch (error) {
      log(error.toString());
      throw Exception(error);
    }
  }

  Future<Response<dynamic>> dioPost(String path, bool? isAuth, {Map<String, dynamic>? body}) {
    try {
      return dio.post(
        path,
        data: body,
        options: Options(
          headers: getHeaders(isAuth: isAuth ?? true),
          responseType: ResponseType.json,
        ),
      );
    } catch (error) {
      log(error.toString());
      throw Exception(error);
    }
  }

  // !--------------------------------------------------------------------------
  // !--------------------------------------------------------------------------

  static const String baseUrl = 'https://test.com/api/';

  // EndPoints
  // static const String EndPoint = '';
  // static const String EndPoint = '';
  // static const String EndPoint = '';
  // static const String EndPoint = '';

  // Functions
  Future<void> login() async {}
}
