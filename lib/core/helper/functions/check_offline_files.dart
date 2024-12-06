import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<bool> checkOfflineFiles(String fileName) async {
  final directory = await getApplicationDocumentsDirectory();
  final filePath = '${directory.path}/$fileName';
  final file = File(filePath);

  return file.existsSync();
}
