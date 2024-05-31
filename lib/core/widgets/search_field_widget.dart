import 'package:flutter/material.dart';

class SearchFieldWidget extends StatelessWidget {
  final void Function(String)? onSubmitted;
  const SearchFieldWidget({super.key, this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onFieldSubmitted: onSubmitted,
        decoration: InputDecoration(
          hintText: 'Search in Articals',
          filled: true,
          fillColor: const Color.fromARGB(255, 226, 226, 226),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
