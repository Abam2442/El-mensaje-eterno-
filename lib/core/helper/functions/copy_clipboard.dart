import 'package:flutter/services.dart';
import 'package:hiwayda_oracion_islamica/core/services/easy_loader_service.dart';

Future<void> copyToClipboard(String text) async {
  await Clipboard.setData(ClipboardData(text: text));
  EasyLoaderService.showToast(message: 'Copiado en el portapapeles');
}
