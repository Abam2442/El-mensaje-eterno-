import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/dialogs/download_dialogs.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:permission_handler/permission_handler.dart';

class DownloadServices extends GetxService {
  /// state
  final RxBool isDownloading = false.obs;

  /// file size
  final RxDouble total = 0.0.obs;

  /// file downloaded data size
  final RxDouble received = 0.0.obs;

  CancelToken _cancelToken = CancelToken();

  Future<String> _getDownloadDirectory() async {
    Directory? directory = Directory('/storage/emulated/0/Download');
    if (!await directory.exists()) {
      directory = await path_provider.getExternalStorageDirectory();
    }
    return directory?.path ?? '';
  }

  Dio _createDio({required String baseUrl}) {
    // initialize dio
    final dio =
        Dio(BaseOptions(baseUrl: baseUrl, headers: {'accept-encoding': "*"}));

    // allow self-signed certificate
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();

      /// set function return  false if you want to allow ssl check
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    };
    return dio;
  }

  download(
      {required String url,
      required String fileName,
      bool showProgressDialog = true,
      bool showSuccessDialog = true,
      bool showFailDialog = true}) async {
    try {
      if (!isDownloading.value &&
          await DownloadDialog.showConfirmDownloadDialog(fileName)) {
        isDownloading.toggle();

        if ((await Permission.storage.request()).isGranted) {
          final splited = url.split('/');
          String baseUrl = '';
          String urlFileName = '';
          for (var i = 0; i < splited.length; i++) {
            if (i == splited.length - 1) {
              urlFileName = "/${splited[i]}";
            } else {
              if (i != 0) {
                baseUrl += '/';
              }
              baseUrl += splited[i];
            }
          }

          final path = await _getDownloadDirectory();

          final Dio dio = _createDio(baseUrl: baseUrl);
         
          int i = 0;
          dio.download(urlFileName, "$path/$fileName",
              onReceiveProgress: (rec, tot) {
            if (i < 10) {
              print("tot $tot, rec $rec");
              i++;
            }
            received.value = rec.toDouble();
            total.value = tot.toDouble();
          }, cancelToken: _cancelToken).then((value) {
            if (Get.isDialogOpen == true) {
              Get.back();
            }
            DownloadDialog.showSuccessDialog(fileName, "$path/$fileName");
            isDownloading.value = false;
            ;
          }).onError((error, stackTrace) {
            print('#eeror $error, $stackTrace');
            if (Get.isDialogOpen == true) {
              Get.back();
            }
            DownloadDialog.showErrorDialog(
                fileName, () => download(url: url, fileName: fileName));
            isDownloading.value = false;
          });
          DownloadDialog.showDownloadProgress(fileName, () {
            Get.back();
            _cancelToken.cancel();
            total.value = 0;
            received.value = 0;
            isDownloading.value = false;
            _cancelToken = CancelToken();
          });
        }
      } else {
        if (isDownloading.value) {
          DownloadDialog.showNotCompeletedDownloadSnakbar(fileName);
        }
      }
    } catch (e) {
      print('#eeror $e');
      isDownloading.value = false;
    }
  }
}
