import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/dialogs/download_dialogs.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:permission_handler/permission_handler.dart';

/// This GetX service provides functionalities for downloading files from URLs.
/// Please don't forget to put this class for the first using time
class DownloadServices extends GetxService {
  /// Observes the download state (true: downloading, false: not downloading).
  final RxBool isDownloading = false.obs;

  /// Observes the total size of the file being downloaded.
  final RxDouble total = 0.0.obs;

  /// Observes the amount of data downloaded so far.
  final RxDouble received = 0.0.obs;

  /// Cancel token used to cancel ongoing downloads.
  CancelToken _cancelToken = CancelToken();

  /// Retrieves the download directory path.
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

  /// Downloads a file from a URL.
  ///
  /// This method initiates the download process for a file from the specified `url`.
  /// You can optionally control the visibility of progress, success, and error dialogs.
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
          }).onError((error, stackTrace) {
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
      isDownloading.value = false;
    }
  }
}
