import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/entities/fixed_entities.dart';
import '../../controller/islam_for_christians_controller.dart';
import '../../widget/app_bar_custom.dart';
import '../../widget/artical_custom.dart';
import '../../widget/inkwell_custom.dart';

class IslamForChristiansTitleScreen extends StatelessWidget {
  final int itemCount;
  final List<FixedEntities> dataText;
  const IslamForChristiansTitleScreen({
    super.key,
    required this.itemCount,
    required this.dataText,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(IslamForChristiansControllerImp());
    return Scaffold(
        appBar: const AppBarCustom(title: "Islam For Christians")
            .customAppBar(context),
        body: GetBuilder<IslamForChristiansControllerImp>(
            builder: ((controller) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: ListView.builder(
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
                    })))));
  }
}
