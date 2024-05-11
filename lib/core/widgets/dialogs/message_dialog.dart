import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/dialogs/download_dialogs.dart';
import 'fancy_dialog.dart';

class MessageDialog extends StatelessWidget {
  final MessageType type;
  final String message;
  final String title;
  final double? height;
  final List<Widget>? actions;
  const MessageDialog(
      {Key? key,
      required this.message,
      required this.type,
      this.title = "",
      this.height,
      this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FancyDialog(
      height: height ?? 250.0,
      icon: (type == MessageType.SUCCESS) ? Icons.check : Icons.close,
      iconColor: (type == MessageType.SUCCESS) ? Colors.green : Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            (type == MessageType.SUCCESS) ? 'éxito' : 'feminine',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
              color: (type == MessageType.SUCCESS) ? Colors.green : Colors.red,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(title, textAlign: TextAlign.center),
          Text(message, textAlign: TextAlign.center),
          const SizedBox(
            height: 30.0,
          ),
          Row(
            children: [
              Expanded(
                child: DialogButton(
                  onTap: () => Get.back(),
                  color:
                      (type == MessageType.SUCCESS) ? Colors.green : Colors.red,
                  text: "OK",
                ),
              ),
              if (actions != null && actions!.isNotEmpty) ...[
                const SizedBox(
                  width: 10,
                ),
                ...actions!
              ]
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: constant_identifier_names
enum MessageType { SUCCESS, ERROR }
