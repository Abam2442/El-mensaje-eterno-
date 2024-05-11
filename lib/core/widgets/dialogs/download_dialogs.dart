import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/services/download_services.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/dialogs/confirm_dialog.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/dialogs/fancy_dialog.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/dialogs/message_dialog.dart';
import 'package:open_file/open_file.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DownloadDialog {
  static Future<bool> showConfirmDownloadDialog(String fileName) async {
    bool? confirm = await Get.dialog(ConfirmMessage(
      message: '¿Desea descargar el archivo "$fileName"?',
      onApproved: () {
        return true;
      },
      onCanceled: () {
        return false;
      },
    ));
    if (confirm != null) return confirm;
    return false;
  }

  static showDownloadProgress(String fileName, onCancel) async {
    final DownloadServices downloadServices = Get.find();

    await Get.dialog(FancyDialog(
        icon: Icons.download,
        child: SizedBox(
          height: 300,
          width: Get.width * .7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Se está descargando el archivo "$fileName"'),
              Obx(() {
                return LinearPercentIndicator(
                  // animation: true,
                  barRadius: const Radius.circular(10),
                  // animationDuration: 400,
                  lineHeight: 15.0,
                  percent: (downloadServices.received.value) /
                      (downloadServices.total.value),
                  backgroundColor: Colors.grey.shade300,
                  progressColor: Colors.blue,
                );
              }),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: DialogButton(
                      onTap: () {
                        Get.back();
                      },
                      text: 'Cerrar',
                      color: Colors.blue.shade200,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: DialogButton(
                      onTap: onCancel,
                      text: 'cacel',
                      color: Colors.red,
                    ),
                  )
                ],
              )
            ],
          ),
        )));
  }

  static showSuccessDialog(String fileName, String filePath) {
    Get.dialog((MessageDialog(
      message: '',
      type: MessageType.SUCCESS,
      actions: [
        DialogButton(
            onTap: () {
              OpenFile.open(filePath);
              Get.back();
            },
            text: 'Abrir archivo')
      ],
    )));
  }

  static showErrorDialog(String fileName, Function() onRetry) {
    Get.dialog((MessageDialog(
      message: '',
      type: MessageType.ERROR,
      actions: [
        DialogButton(
            onTap: () {
              Get.back();
              onRetry();
            },
            text: 'Reintentar')
      ],
    )));
  }

  static showNotCompeletedDownloadSnakbar(String fileName) {
    Get.snackbar('', "La descarga actual debe finalizar primero",
        icon: const Icon(Icons.download));
  }
}

class DialogButton extends StatelessWidget {
  const DialogButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.color = AppColors.primary});
  final Function() onTap;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
