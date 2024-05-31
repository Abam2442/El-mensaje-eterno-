import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/search_field_widget.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/knowing_allah/Artical/search/article_search.dart';

import '../../../controller/knowing_allah/knowing_allah_controller.dart';
import '../../../widget/app_bar_custom.dart';
import '../../../widget/inkwell_custom.dart';
// ignore: unused_import
import 'artical_contain_screen.dart';

class KnowingAllahArticalScreen extends StatelessWidget {
  const KnowingAllahArticalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(KnowingAllahControllerImp());
    return Scaffold(
        appBar: const AppBarCustom(title: 'knowing allah artical')
            .customAppBar(context),
        body: GetBuilder<KnowingAllahControllerImp>(
            builder: (controller) => Column(
                  children: [
                    SearchFieldWidget(
                      onSubmitted: (val) => {
                        controller.searchArticle(val, controller.articals),
                        Get.to(() => const KnowingAllahArticalSearch())
                      },
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
                                Get.to(KnowingAllahArticalContainScreen(
                                  dataText:
                                      controller.articals[index].subcategories,
                                  itemCount: controller
                                      .articals[index].subcategories.length,
                                  index: index,
                                ));
                              },
                            );
                          }),
                    ),
                  ],
                )));
  }
}
