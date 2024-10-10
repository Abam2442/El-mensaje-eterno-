import '../constants/app_colors.dart';
import '../constants/app_enums.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryDialog extends StatelessWidget {
  final String title;
  final Color titleColor;
  final List<Widget> children;
  final String okText;
  final Function()? btnOkOnPress;
  final Function()? btnCancelOnPress;
  final bool hasBtnCancel;
  final bool hasBtns;
  final bool barrierDismissible;
  final bool disableBack;
  final StateType? stateType;
  final String validationMessage;

  const PrimaryDialog({
    super.key,
    required this.title,
    this.titleColor = AppColors.primary,
    this.children = const [],
    this.okText = 'Ok',
    this.btnOkOnPress,
    this.btnCancelOnPress,
    this.hasBtnCancel = true,
    this.hasBtns = true,
    this.barrierDismissible = true,
    this.disableBack = false,
    this.stateType = StateType.init,
    this.validationMessage = '',
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.hardEdge,
      insetPadding: EdgeInsets.all(50.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      // child: PopScope(
      //   canPop: disableBack ? !disableBack : stateType != StateType.loading,
      //   child: ListView(
      //     padding: const EdgeInsets.symmetric(vertical: 15),
      //     shrinkWrap: true,
      //     children: [
      //       if (stateType == StateType.offline ||
      //           stateType == StateType.badRequest ||
      //           stateType == StateType.internalServerProblem ||
      //           stateType == StateType.unexpectedProblem)
      //         Container(
      //           margin: const EdgeInsets.symmetric(horizontal: 20),
      //           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(5),
      //             color: AppColors.white,
      //             boxShadow: [
      //               BoxShadow(
      //                 blurRadius: 5,
      //                 color: AppColors.gray.withOpacity(0.5),
      //                 inset: true,
      //               ),
      //               BoxShadow(
      //                 offset: const Offset(1, 2),
      //                 blurRadius: 5,
      //                 spreadRadius: 2,
      //                 color: AppColors.gray.withOpacity(0.5),
      //                 inset: true,
      //               ),
      //             ],
      //           ),
      //           child: Row(
      //             children: [
      //               Icon(
      //                 stateType == StateType.offline
      //                     ? Icons.wifi_off_rounded
      //                     : stateType == StateType.internalServerProblem
      //                         ? Icons.report_problem_outlined
      //                         : Icons.error_outline_rounded,
      //                 size: 25,
      //                 color: AppColors.gray,
      //               ),
      //               const SizedBox(
      //                 width: 5,
      //               ),
      //               Expanded(
      //                 child: Text(
      //                   validationMessage,
      //                   style: const TextStyle(
      //                     fontSize: 12,
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       Padding(
      //         padding: const EdgeInsets.symmetric(vertical: 20),
      //         child: Text(
      //           title,
      //           textAlign: TextAlign.center,
      //           style: Theme.of(context).textTheme.headlineLarge!.copyWith(
      //                 fontSize: 22,
      //                 color: titleColor,
      //               ),
      //         ),
      //       ),
      //       ...children,
      //       const SizedBox(
      //         height: 30,
      //       ),
      //       Padding(
      //         padding: EdgeInsets.symmetric(horizontal: 15.w),
      //         child: Row(
      //           children: [
      //             AnimatedContainer(
      //               duration: const Duration(seconds: 2),
      //               child: Expanded(
      //                 flex: 3,
      //                 child: MaterialButton(
      //                   padding: const EdgeInsets.all(0),
      //                   onPressed: stateType != StateType.loading
      //                       ? () {
      //                           if (btnOkOnPress != null) {
      //                             btnOkOnPress!.call();
      //                           }
      //                         }
      //                       : null,
      //                   disabledColor: titleColor.withOpacity(0.7),
      //                   color: titleColor,
      //                   shape: const RoundedRectangleBorder(
      //                     borderRadius: BorderRadius.all(Radius.circular(15)),
      //                   ),
      //                   child: stateType == StateType.loading
      //                       ? Row(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           children: [
      //                             const PrimaryLoader(
      //                               color: AppColors.white,
      //                               size: 20,
      //                             ),
      //                             const SizedBox(
      //                               width: 10,
      //                             ),
      //                             Text(
      //                               AppTranslationKeys.waiting.tr,
      //                               style: const TextStyle(
      //                                 color: AppColors.white,
      //                               ),
      //                             ),
      //                           ],
      //                         )
      //                       : FittedBox(
      //                           child: Text(
      //                             okText,
      //                             style: const TextStyle(
      //                               color: AppColors.white,
      //                             ),
      //                           ),
      //                         ),
      //                 ),
      //               ),
      //             ),
      //             if (hasBtnCancel && stateType != StateType.loading)
      //               const SizedBox(
      //                 width: 15,
      //               ),
      //             if (hasBtnCancel && stateType != StateType.loading)
      //               Expanded(
      //                 flex: 3,
      //                 child: MaterialButton(
      //                   padding: const EdgeInsets.all(0),
      //                   onPressed: () {
      //                     Get.back();
      //                     if (btnCancelOnPress != null) {
      //                       btnCancelOnPress!.call();
      //                     }
      //                   },
      //                   color: AppColors.white,
      //                   shape: const RoundedRectangleBorder(
      //                     borderRadius: BorderRadius.all(Radius.circular(15)),
      //                   ),
      //                   child: FittedBox(
      //                     child: Text(
      //                       AppTranslationKeys.cancel.tr,
      //                       style: const TextStyle(
      //                         color: AppColors.gray,
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
