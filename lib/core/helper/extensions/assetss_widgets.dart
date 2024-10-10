import 'package:flutter/material.dart';

extension Assets on int {
  // SizedBoxs
  SizedBox get hSize => SizedBox(height: toDouble());
  SizedBox get wSize => SizedBox(width: toDouble());
  SizedBox get sSize =>
      SizedBox(height: toDouble(), width: toDouble());
  // EdgeInsets
  EdgeInsets get aEdge => EdgeInsets.all(toDouble());
  EdgeInsets get hEdge => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get vEdge => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsets get tEdge => EdgeInsets.only(top: toDouble());
  EdgeInsets get vhEdge => EdgeInsets.symmetric(
        vertical: toDouble() / 2,
        horizontal: toDouble(),
      );
  EdgeInsets get hvEdge => EdgeInsets.symmetric(
    vertical: toDouble() ,
    horizontal: toDouble()/ 2,
  );
  //
  BorderRadius get cBorder => BorderRadius.circular(toDouble());
  //
  Divider get divider =>
      Divider(thickness: toDouble(), color: const Color(0xffF2F4F7));
}
