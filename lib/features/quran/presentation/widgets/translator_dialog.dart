// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/quran_controller.dart';

// class TranslatorDialog extends StatelessWidget {
//   const TranslatorDialog({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('Elija Traducir'),
//       content: GetBuilder<QuranController>(
//         builder: (controller) {
//           return Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 title: const Text('Julio Cortes'),
//                 onTap: () {
//                   controller.updateSelectedTranslator(1);
//                   Navigator.of(context).pop();
//                 },
//               ),
//               ListTile(
//                 title: const Text('Raúl Gonzalez'),
//                 onTap: () {
//                   controller.updateSelectedTranslator(2);
//                   Navigator.of(context).pop();
//                 },
//               ),
//               ListTile(
//                 title: const Text('Isa García'),
//                 onTap: () {
//                   controller.updateSelectedTranslator(3);
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         }
//       ),
//     );
//   }
// }
