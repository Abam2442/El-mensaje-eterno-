import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<String> datePicker(BuildContext context) async {
  String formattedDate = '';
  DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      //DateTime.now() - not to allow to choose before today.
      lastDate: DateTime(2100));

  if (pickedDate != null) {
    formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
  } else {
    formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  }
  return formattedDate;
}
