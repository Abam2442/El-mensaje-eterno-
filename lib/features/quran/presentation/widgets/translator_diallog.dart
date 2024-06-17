// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/quran_controller.dart';

// class TranslatorDialog extends StatelessWidget {
//   const TranslatorDialog({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('Elija Traducir'),
//       content: GetBuilder<QuranController>(builder: (controller) {
//         return ListView.builder(
//             itemCount: controller.translator.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 onTap: () => controller.updateSelectedTranslator(index),
//                 title: Text(controller.translator[index]),
//               );
//             });
//       }),
//     );
//   }
// }
