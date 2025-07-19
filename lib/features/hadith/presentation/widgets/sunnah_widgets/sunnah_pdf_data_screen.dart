import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SunnahPdfDataScreen extends StatefulWidget {
  final String path;
  const SunnahPdfDataScreen({super.key, required this.path});

  @override
  _SunnahPdfDataScreenState createState() => _SunnahPdfDataScreenState();
}

class _SunnahPdfDataScreenState extends State<SunnahPdfDataScreen> {
  Uint8List? _pdfBytes;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }
  

  Future<void> _loadPdf() async {
    log('Loading PDF from: ${widget.path}');
    try {
      // Load PDF asset as bytes
      final data = await DefaultAssetBundle.of(context).load(widget.path);
      setState(() {
        _pdfBytes = data.buffer.asUint8List();
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Error loading PDF: $e';
      });
      print(_errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    final SharedPreferences shared = Get.find();
    // Initialize page number (convert from 1-based to 0-based indexing)
    final initialPage = (shared.getInt(widget.path) ?? 1) - 1;

    return Scaffold(
      body: _pdfBytes != null
          ? PDFView(
              pdfData: _pdfBytes, // Pass the loaded PDF bytes
              enableSwipe: true,
              swipeHorizontal: false, // Vertical scrolling
              autoSpacing: true,
              pageFling: true,
              defaultPage: initialPage,
              onError: (error) {
                print('PDF Error: $error');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error loading PDF: $error')),
                );
              },
              onPageError: (page, error) {
                print('Page $page Error: $error');
              },
              onPageChanged: (int? page, int? total) {
                if (page != null) {
                  // Save page number (convert to 1-based indexing)
                  shared.setInt(widget.path, page + 1);
                }
              },
            )
          : Center(
              child: _errorMessage != null
                  ? Text(_errorMessage!)
                  : CircularProgressIndicator(),
            ),
    );
  }
}
