import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/search_field_widget.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/rasul_uallah/Artical/search/article_search.dart';

import '../../../controller/rasuluallah/rasulullah_controller.dart';
import '../../../widget/app_bar_custom.dart';
import '../../../widget/inkwell_custom.dart';
import 'artical_contain_screen.dart';

class RasuluallahArticalScreen extends StatelessWidget {
  const RasuluallahArticalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RasuluallhControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: 'Rasul allah artical')
          .customAppBar(context),
      body: GetBuilder<RasuluallhControllerImp>(
        builder: (controller) =>
            controller.getArticalsState != StateType.success
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      SearchFieldWidget(
                        onSubmitted: (val) => {
                          controller.searchArticle(val, controller.articals),
                          Get.to(() => const RasuluallahArticalSearch())
                        },
                        formState: controller.formState,
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(5),
                          itemCount: controller.articals.length,
                          itemBuilder: (context, index) {
                            return InkwellCustom(
                              catigory: false,
                              dataText: controller.articals[index].category,
                              onTap: () {
                                Get.to(ArticalContainScreen(
                                  dataText: controller.articals[index].data,
                                  index: index,
                                ));
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}
