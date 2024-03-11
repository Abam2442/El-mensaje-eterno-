import 'dart:io';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_text_styles.dart';
import 'package:hiwayda_oracion_islamica/views/widgets/platform_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PlatformAlertDialog extends PlatformWidget {
  const PlatformAlertDialog({super.key,
    @required this.title,
    @required this.content,
    this.cancelActionText,
    @required this.defaultActionText,
  })
      : assert(title != null),
        assert(content != null),
        assert(defaultActionText != null);

  final String? title;
  final String? content;
  final String? cancelActionText;
  final String? defaultActionText;

  Future<bool?> show(BuildContext context) async {
    return Platform.isIOS
        ? await showCupertinoDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (context) => this,
    )
        : await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => this,
    );
  }

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title!),
      content: Text(content!,style: const TextStyle(fontSize: 24),),
      actions: _buildActions(context),
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return AlertDialog(
      title: Text(title!),
      content: Text(content!,style: const TextStyle(fontSize: 24),),
      actions: _buildActions(context),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    final actions = <Widget>[];
    if (cancelActionText != null) {
      actions.add(
        PlatformAlertDialogAction(
          child: buildButton(cancelActionText!),
          onPressed: () => Navigator.of(context).pop(false),
        ),
      );
    }
    actions.add(
      PlatformAlertDialogAction(
          child: buildButton(defaultActionText!),
          onPressed: () => Navigator.of(context).pop(true)
      ),
    );
    return actions;
  }

  Widget buildButton(String txt) {
    return Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [AppColors.kBlackColor,AppColors.kPrimaryColor]
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: AppColors.grayAccent)),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: Text(txt,style:AppTextStyles.h5white,)));
  }

}


class PlatformAlertDialogAction extends PlatformWidget {
  const PlatformAlertDialogAction({super.key, this.child, this.onPressed});

  final Widget? child;
  final VoidCallback? onPressed;

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoDialogAction(
      onPressed: onPressed,
      child: child!,
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: child!,
    );
  }
}
