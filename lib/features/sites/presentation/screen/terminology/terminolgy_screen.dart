import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/search_field_widget.dart';
import '../../controller/terminology_controller.dart';
import '../../widget/app_bar_custom.dart';
import '../../widget/artical_custom.dart';
import '../../widget/inkwell_custom.dart';

class TerminologyScreen extends StatelessWidget {
  const TerminologyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TerminologyControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: 'Terminology').customAppBar(context),
      body: GetBuilder<TerminologyControllerImp>(builder: (controller) {
        if (controller.articals.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: [
            SearchFieldWidget(
              formState: controller.formState,
              onSubmitted: controller.searchFun,
            ),
            Expanded(
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
                  }),
            ),
          ],
        );
      }),
    );
  }
}
