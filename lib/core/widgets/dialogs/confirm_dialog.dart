import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'fancy_dialog.dart';

class ConfirmMessage extends StatelessWidget {
  const ConfirmMessage(
      {super.key,
      required this.message,
      this.onApproved,
      this.onCanceled,
      this.reverseColor = false});
  final String message;
  final Function()? onApproved;
  final Function()? onCanceled;
  final bool reverseColor;

  @override
  Widget build(BuildContext context) {
    return FancyDialog(
      height: 290.0,
      icon: Icons.help_outline,
      iconColor: AppColors.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Confirmar',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(message,
              style: const TextStyle(
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center),
          const SizedBox(
            height: 30.0,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    if (onApproved != null) onApproved!();
                    Get.back(result: true);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: reverseColor ? Colors.red : AppColors.primary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                        child: Text(
                      "De acuerdo",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    if (onCanceled != null) onCanceled!();
                    Get.back(result: false);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: reverseColor ? AppColors.primary : Colors.red,
                    ),
                    child: const Center(
                        child: Text(
                      "Cancelar",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
