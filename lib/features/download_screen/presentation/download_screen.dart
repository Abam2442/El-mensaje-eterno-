import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/download_screen/controller/download_screen_controller.dart';
import 'package:hiwayda_oracion_islamica/features/download_screen/presentation/widgets/header_widget.dart';
import 'package:hiwayda_oracion_islamica/features/download_screen/presentation/widgets/loading_widget.dart';
import 'package:hiwayda_oracion_islamica/features/download_screen/presentation/widgets/selection_widget.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DownloadScreenController());
    return const Scaffold(
      body: Column(
        children: [
          HeaderWidget(),
          SelectionWidget(),
          LoadingWidget(),
        ],
      ),
    );
  }
}
