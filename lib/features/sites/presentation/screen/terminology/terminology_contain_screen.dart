import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/artical_custom.dart';
import '../../widget/app_bar_custom.dart';
import '../../widget/inkwell_custom.dart';

class TerminologyContainScreen extends StatelessWidget {
  final int itemCount;
  final String title;
  final List<FixedEntities> dataText;
  const TerminologyContainScreen({
    super.key,
    required this.itemCount,
    required this.dataText,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarCustom(title: "Terminology").customAppBar(context),
        body: ListView.builder(
            padding: const EdgeInsets.all(5),
            itemCount: itemCount,
            itemBuilder: (context, index) {
              return InkwellCustom(
                catigory: false,
                dataText: dataText[index].name,
                onTap: () {
                  Get.to(ArticalCustom(
                    dataText: dataText[index].content,
                  ));
                },
              );
            }));
  }
}
