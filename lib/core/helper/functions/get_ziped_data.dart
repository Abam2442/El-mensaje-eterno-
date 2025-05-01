 // Extract all files from the zip to the documents directory
  import 'dart:developer';
import 'dart:io';
import 'package:archive/archive.dart';
import 'package:flutter/services.dart';

Future<String> extractZip({required String zipPath, required String destinationDir}) async {
  try {
    // Load the zip file
    final ByteData zipData = await rootBundle.load(zipPath);
    final Uint8List bytes = zipData.buffer.asUint8List();
    
    // Decode the zip
    final Archive archive = ZipDecoder().decodeBytes(bytes);
    
    // Determine destination directory
    final String dir = destinationDir;
    
    // Create the directory if it doesn't exist
    Directory(dir).createSync(recursive: true);
    
    // Extract each file
    for (final file in archive) {
      final filename = file.name;
      if (file.isFile) {
        final data = file.content as List<int>;
        File('$dir/$filename')
          ..createSync(recursive: true)
          ..writeAsBytesSync(data);
      } else {
        Directory('$dir/$filename').createSync(recursive: true);
      }
    }
    
    return dir;
  } catch (e) {
    log('Error extracting zip $zipPath: $e');
    rethrow;
  }
}