import '../constants/app_colors.dart';
import '../constants/app_translation_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class PrimaryMultiSelectItem<T> extends StatelessWidget {
  final String labelText;
  final String hintText;
  final List<MultiSelectItem<T>> allItems;
  final List<MultiSelectItem<T>> selectedItems;
  final List<T> selectedItemsValue;
  final void Function(List<T> values) onChanged;
  final FormFieldValidator? validator;

  const PrimaryMultiSelectItem({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.onChanged,
    required this.allItems,
    required this.selectedItems,
    required this.selectedItemsValue,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: AppColors.gray,
                  fontSize: 14,
                ),
          ),
          SizedBox(
            height: 8.h,
          ),
          if (selectedItemsValue.isEmpty)
            TextFormField(
              onTap: () async {
                await showDialogSelect();
              },
              readOnly: true,
              validator: validator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: AppColors.gray.withOpacity(0.5)),
                errorMaxLines: 3,
                filled: true,
                fillColor: AppColors.primary20,
                suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide.none,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide.none,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.all(8.w),
              ),
            ),
          InkWell(
            onTap: () async {
              await showDialogSelect();
            },
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
            child: MultiSelectChipDisplay<T>(
              alignment: Get.locale!.languageCode == 'ar' ? Alignment.centerRight : Alignment.centerLeft,
              decoration: BoxDecoration(
                color: AppColors.primary20,
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
              ),
              scroll: false,
              textStyle: const TextStyle(fontSize: 14),
              onTap: (p0) async {
                await showDialogSelect();
              },
              items: selectedItems,
            ),
          ),
        ],
      ),
    );
  }

  showDialogSelect() async {
    await Get.dialog(
      MultiSelectDialog<T>(
        confirmText: Text(AppTranslationKeys.confirm.tr),
        cancelText: Text(AppTranslationKeys.close.tr),
        title: Text(hintText),
        selectedColor: AppColors.primary,
        height: Get.height * 0.5,
        items: allItems,
        initialValue: selectedItemsValue,
        onConfirm: onChanged,
      ),
    );
  }
}
//
// class Pair {
//   int id;
//   String name;
//
//   Pair({
//     required this.id,
//     required this.name,
//   });
// }
