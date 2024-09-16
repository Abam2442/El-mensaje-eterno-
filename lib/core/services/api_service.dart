import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constants/app_api_routes.dart';
import '../errors/exception.dart';
import '../helpers/get_exception_from_status_code.dart';
import '../helpers/header.dart';
import '../helpers/network_info.dart';

class ApiService extends GetxService {
  final http.Client client;
  final NetworkInfo networkInfo;

  ApiService({
    required this.client,
    required this.networkInfo,
  });

  // Future<Map<String, dynamic>> post({
  //   required String subUrl,
  //   required Map<String, dynamic> data,
  //   bool needToken = false,
  // }) async {
  //   try {
  //     if (!(await networkInfo.isConnected)) {
  //       throw OfflineException();
  //     }
  //     final response = await client.post(
  //       Uri.http(
  //         AppApiRoutes.baseUrl,
  //         subUrl,
  //       ),
  //       body: json.encode(data),
  //       headers: setHeaders(),
  //     );
  //     getExceptionStatusCode(response);

  //     return Future.value(json.decode(response.body));
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<Map<String, dynamic>> get({
    required String subUrl,
    Map<String, String>? parameters,
    bool needToken = false,
    String? key,
  }) async {
    try {
      if (!(await networkInfo.isConnected)) {
        throw OfflineException();
      }
      parameters?.removeWhere((key, value) => value == 'null');
      final response = await client.get(
        Uri.http(
          AppApiRoutes.baseUrl,
          subUrl,
          parameters,
        ),
        headers: setHeaders(),
      );
      getExceptionStatusCode(response);

      return Future.value((json.decode(response.body)));
    } catch (e) {
      rethrow;
    }
  }
}
