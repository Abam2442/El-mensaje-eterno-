import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/entities/islam_message_entities.dart';
import '../../controller/islam_message_controller.dart';
import '../../widget/app_bar_custom.dart';
import '../../widget/artical_custom.dart';
import '../../widget/inkwell_custom.dart';

class IslamMessageContainArticalScreen extends StatelessWidget {
  final int itemCount;
  final List<SubArticalEntities> dataText;
  const IslamMessageContainArticalScreen({
    super.key,
    required this.itemCount,
    required this.dataText,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(IslamMessageControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: "Islam Message Artical").customAppBar(context),
      body: GetBuilder<IslamMessageControllerImp>(
          builder: (controller) => Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    return InkwellCustom(
                      catigory: false,
                      dataText: dataText[index].subArticalName,
                      onTap: () {
                        Get.to(ArticalCustom(
                            dataText: dataText[index].bodyArtical));
                      },
                    );
                  }))),
    );
  }
}
