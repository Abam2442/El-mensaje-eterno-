import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/entities/islam_for_christians_entities.dart';
import '../../controller/islam_religion_controller.dart';
import '../../widget/app_bar_custom.dart';
import '../../widget/inkwell_custom.dart';
import 'islam_religion_title_screen.dart';

class IslamReligionContainScreen extends StatelessWidget {
  final int itemCount;
  final List<IslamForChristiansEntities> dataText;
  const IslamReligionContainScreen({
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
                        Get.to(IslamReligionTitleScreen(
                          itemCount: dataText[index].subCatigory.length,
                          dataText: dataText[index].subCatigory,
                        ));
                      },
                    );
                  }))),
    );
  }
}
