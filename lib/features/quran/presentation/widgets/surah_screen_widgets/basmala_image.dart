import 'package:flutter/material.dart';


class BasmalaImage extends StatelessWidget {
  const BasmalaImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/basmala.png',
      height: 78,
      width: double.infinity,
      fit: BoxFit.fitWidth,
    );
  }
}
