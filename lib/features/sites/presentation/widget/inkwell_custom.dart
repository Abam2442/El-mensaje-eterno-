import 'package:flutter/material.dart';

import 'container_custom.dart';

class InkwellCustom extends StatelessWidget {
  final void Function() onTap;
  final bool catigory;
  final String dataText;
  final IconData? iconData;
  const InkwellCustom({
    super.key,
    required this.onTap,
    required this.catigory,
    required this.dataText,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: ContainerCustom(
          iconData: iconData,
          catigory: catigory,
          dataText: dataText,
        ));
  }
}
