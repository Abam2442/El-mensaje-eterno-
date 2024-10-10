import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SunnahPdfDataScreen extends StatelessWidget {
  final String path;
  const SunnahPdfDataScreen({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    final SharedPreferences shared = Get.find();
    final pdfController = PdfController(
        document: PdfDocument.openAsset(path),
        initialPage: shared.getInt(path) ?? 1);
    return Scaffold(
      body: PdfView(
        controller: pdfController,
        scrollDirection: Axis.vertical,
        onPageChanged: (int index) {
          shared.setInt(path, index);
        },
      ),
    );
  }
}
