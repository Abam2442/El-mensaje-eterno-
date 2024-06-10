import 'package:flutter/material.dart';

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
            filled: true,
            fillColor: const Color.fromARGB(255, 226, 226, 226),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
