import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../domain/entities/fixed_entities.dart';
import '../../../controller/knowing_allah_controller.dart';
import '../../../controller/rasulullah_controller.dart';
import '../../../widget/app_bar_custom.dart';
import '../../../widget/inkwell_custom.dart';

class KnowingAllahVideoContainScreen extends StatelessWidget {
  final int itemCount;
  final List<FixedEntities> dataText;
  const KnowingAllahVideoContainScreen({
    super.key,
    required this.itemCount,
    required this.dataText,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(KnowingAllahControllerImp());
    return Scaffold(
        appBar: const AppBarCustom(title: 'Video').customAppBar(context),
        body: GetBuilder<KnowingAllahControllerImp>(
            builder: ((controller) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: ListView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: itemCount,
                    itemBuilder: (context, index) {
                      return InkwellCustom(
                        catigory: false,
                        dataText: dataText[index].name,
                        onTap: () async {
                          await launchUrl(Uri.parse(dataText[index].content));
                        },
                      );
                    })))));
  }
}
