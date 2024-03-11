import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/islam_message_controller.dart';
import '../../widget/app_bar_custom.dart';
import '../../widget/inkwell_custom.dart';
import 'islam_message_book_contain_screen.dart';

class IslamMessageBookScreen extends StatelessWidget {
  const IslamMessageBookScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(IslamMessageControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: "Islam Message Book").customAppBar(context),
      body: GetBuilder<IslamMessageControllerImp>(
          builder: (controller) => Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: controller.books.length,
                  itemBuilder: (context, index) {
                    return InkwellCustom(
                      catigory: false,
                      dataText: controller.books[index].name,
                      onTap: () {
                        Get.to(IslamMessageContainBookScreen(
                          itemCount: controller.books[index].subCatigory.length,
                          dataText: controller.books[index].subCatigory,
                        ));
                      },
                    );
                  }))),
    );
  }
}
