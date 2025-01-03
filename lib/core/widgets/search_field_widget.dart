import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';

class SearchFieldWidget extends StatelessWidget {
  final void Function(String)? onSubmitted;
  final GlobalKey<FormState> formState;
  final String text;
  const SearchFieldWidget(
      {super.key,
      this.onSubmitted,
      required this.formState,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formState,
        child: TextFormField(
          validator: (val) {
            if (val!.isEmpty) {
              return 'Not Valid Input';
            }
            return null;
          },
          onFieldSubmitted: onSubmitted,
          decoration: InputDecoration(
            hintText: text,
            hintStyle: const TextStyle(
              color: AppColors.kGoldenColor,
            ),
            filled: true,
            fillColor: AppColors.kPrimaryColor,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
