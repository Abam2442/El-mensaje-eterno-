import '../constants/app_enums.dart';
import '../constants/app_colors.dart';
import '../services/easy_loader_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HandleStatesWidget extends StatelessWidget {
  final StateType stateType;
  final String validationMessage;
  final Widget child;
  final Widget? shimmerChild;
  final bool hasShimmer;
  final void Function()? onPressedTryAgain;

  const HandleStatesWidget({
    super.key,
    required this.stateType,
    required this.child,
    this.onPressedTryAgain,
    this.hasShimmer = false,
    this.shimmerChild,
    this.validationMessage = '',
  });

  @override
  Widget build(BuildContext context) {
    if (hasShimmer) {
      switch (stateType) {
        case StateType.success:
        case StateType.init:
          return child;
        case StateType.loading:
          return shimmerChild!;
        default:
          return Center(
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 40),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Center(
                    child: Icon(
                      stateType == StateType.offline
                          ? Icons.wifi_off_rounded
                          : stateType == StateType.internalServerProblem
                              ? Icons.report_problem_outlined
                              : Icons.error_outline_rounded,
                      size: 75,
                    ),
                  ),
                ),
                Text(
                  validationMessage.tr,
                  textAlign: TextAlign.center,
                ),
                (stateType != StateType.success ||
                            stateType == StateType.unexpectedProblem ||
                            stateType == StateType.internalServerProblem) &&
                        onPressedTryAgain != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        child: CircleAvatar(
                          backgroundColor: AppColors.gray.withOpacity(0.2),
                          child: IconButton(
                            onPressed: onPressedTryAgain,
                            icon: const Icon(
                              Icons.refresh,
                              color: AppColors.primary10,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          );
      }
    }
    switch (stateType) {
      case StateType.success:
      case StateType.init:
        EasyLoaderService.dismiss();
        return child;
      case StateType.loading:
        {
          EasyLoaderService.showLoading();
          // return PopScope(
          //   canPop: stateType != StateType.loading,
          //   child: child,
          // );
          return const SizedBox.shrink();
        }
      default:
        {
          switch (stateType) {
            case StateType.offline:
              EasyLoaderService.showOfflineError();
              break;
            case StateType.internalServerProblem:
              EasyLoaderService.showInternalServerError();
              break;
            default:
              EasyLoaderService.showError(
                message: validationMessage,
              );
          }
          return child;
        }
    }
  }
}
