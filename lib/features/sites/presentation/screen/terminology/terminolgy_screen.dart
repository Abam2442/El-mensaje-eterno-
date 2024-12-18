import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/search_field_widget.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/terminology/terminology_contain_screen.dart';
import '../../controller/terminology_controller.dart';
import '../../widget/app_bar_custom.dart';
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
              text: 'Buscar en artículos',
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
                      iconData: Icons.category,
                      dataText: controller.articals[index].category,
                      onTap: () {
                        Get.to(() => TerminologyContainScreen(
                              title: controller.articals[index].category,
                              dataText: controller.articals[index].data,
                              itemCount: controller.articals[index].data.length,
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
