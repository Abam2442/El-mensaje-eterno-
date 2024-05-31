import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/search_field_widget.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/islam_messages/islam_message_controller.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/islam_message/articals/islam_message_artical_contain_screen.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/inkwell_custom.dart';

class IslamMessageArticalSearch extends StatelessWidget {
  const IslamMessageArticalSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: "Islam Message Artical")
          .customAppBar(context),
      body: GetBuilder<IslamMessageControllerImp>(
          builder: (controller) =>
              controller.getArticalsState != StateType.success
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(5),
                              itemCount: controller.searchResult.length,
                              itemBuilder: (context, index) {
                                return InkwellCustom(
                                  catigory: false,
                                  dataText: controller.searchResult[index].name,
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
