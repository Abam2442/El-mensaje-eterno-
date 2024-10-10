import '../constants/app_colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PrimarySelectItem<T> extends StatelessWidget {
  final String labelText;
  final String hintText;
  final List<DropdownMenuItem<T>> items;
  final T? selectedItem;
  final void Function(T? value) onChanged;

  const PrimarySelectItem({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.onChanged,
    required this.items,
    required this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        isExpanded: true,
        hint: Text(
          hintText,
          style: TextStyle(color: AppColors.gray.withOpacity(0.5)),
        ),
        items: items,
        value: selectedItem,
        onChanged: onChanged,
        iconStyleData: const IconStyleData(
          icon: Icon(Icons.keyboard_arrow_down_rounded),
        ),
        buttonStyleData: ButtonStyleData(
          padding: EdgeInsets.only(
            left: Get.locale!.languageCode == 'ar' ? 10.w : 0,
            right: Get.locale!.languageCode == 'en' ? 10.w : 0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColors.primary20,
          ),
        ),
      ),
    );
  }
}
