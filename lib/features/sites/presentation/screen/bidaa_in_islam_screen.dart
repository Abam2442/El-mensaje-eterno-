import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/bidaa_controller.dart';
import '../widget/app_bar_custom.dart';
import '../widget/artical_custom.dart';
import '../widget/inkwell_custom.dart';

class BidaaInIslamScreen extends StatelessWidget {
  const BidaaInIslamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BidaaInIslamControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: 'Bidaa in islam').customAppBar(context),
      body: GetBuilder<BidaaInIslamControllerImp>(
          builder: (controller) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: controller.articals.length,
                  itemBuilder: (context, index) {
                    return InkwellCustom(
                      catigory: false,
                      dataText: controller.articals[index].name,
                      onTap: () {
                        Get.to(ArticalCustom(
                          dataText: controller.articals[index].content,
                        ));
                      },
                    );
                  }))),
    );
  }
}
