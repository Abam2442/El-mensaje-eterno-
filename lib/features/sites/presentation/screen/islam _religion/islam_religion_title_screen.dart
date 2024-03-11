import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/entities/fixed_entities.dart';
import '../../controller/islam_religion_controller.dart';
import '../../widget/app_bar_custom.dart';
import '../../widget/artical_custom.dart';
import '../../widget/inkwell_custom.dart';

class IslamReligionTitleScreen extends StatelessWidget {
  final int itemCount;
  final List<FixedEntities> dataText;
  const IslamReligionTitleScreen({
    super.key,
    required this.itemCount,
    required this.dataText,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(IslamReligionControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: "Islam Religion").customAppBar(context),
      body: GetBuilder<IslamReligionControllerImp>(
          builder: (controller) => Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    return InkwellCustom(
                      catigory: false,
                      dataText: dataText[index].name,
                      onTap: () {
                        Get.to(
                            ArticalCustom(dataText: dataText[index].content));
                      },
                    );
                  }))),
    );
  }
}
