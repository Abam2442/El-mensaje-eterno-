import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/search_field_widget.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/islam_messages/islam_message_controller.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/islam_message/articals/search/islam_message_article_search.dart';
import '../../../widget/app_bar_custom.dart';
import '../../../widget/inkwell_custom.dart';
import 'islam_message_artical_contain_screen.dart';

class IslamMessageArticalScreen extends StatelessWidget {
  const IslamMessageArticalScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: "Islam Message Artical")
          .customAppBar(context),
      body: GetBuilder<IslamMessageControllerImp>(
          builder: (controller) => controller.getArticalsState !=
                  StateType.success
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    SearchFieldWidget(
                        onSubmitted: (val) => {
                              controller.searchFun(val),
                              Get.to(() => const IslamMessageArticalSearch())
                            }),
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(5),
                          itemCount: controller.articals.length,
                          itemBuilder: (context, index) {
                            return InkwellCustom(
                              catigory: false,
                              dataText: controller.articals[index].name,
                              onTap: () {
                                Get.to(IslamMessageContainArticalScreen(
                                  index: index,
                                ));
                              },
                            );
                          }),
                    ),
                  ],
                )),
    );
  }
}
