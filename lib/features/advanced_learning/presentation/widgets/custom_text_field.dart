// ignore_for_file: unused_import, prefer_const_constructors, sized_box_for_whitespace, camel_case_types, prefer_typing_uninitialized_variables, non_constant_identifier_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, must_be_immutable, file_names

import 'package:flutter/material.dart';

class C_TextField extends StatelessWidget {
  C_TextField({
    required this.hint_text,
    required this.searchControlle,
  });

  final searchControlle;
  final hint_text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          width: 338,
          height: 55,
          child: TextFormField(
            controller: searchControlle,
            decoration: InputDecoration(
              hintText: hint_text,
              hintStyle: TextStyle(color: Color.fromARGB(255, 104, 103, 103)),
              filled: true,
              fillColor: Colors.grey[400],
              labelStyle: TextStyle(fontSize: 12),
              contentPadding: EdgeInsets.only(left: 30),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
