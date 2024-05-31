import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/search_field_widget.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/knowing_allah/knowing_allah_controller.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/knowing_allah/Artical/artical_contain_screen.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/inkwell_custom.dart';
// import 'package:flutter/widgets.dart';

class KnowingAllahArticalSearch extends StatelessWidget {
  const KnowingAllahArticalSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: 'knowing allah artical')
          .customAppBar(context),
      body: GetBuilder<KnowingAllahControllerImp>(
        builder: (controller) => Column(
          children: [
            SearchFieldWidget(
              onSubmitted: (val) =>
                  {controller.searchArticle(val, controller.articals)},
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: controller.searchResult.length,
                  itemBuilder: (context, index) {
                    return InkwellCustom(
                      catigory: false,
                      dataText: controller.searchResult[index].name,
                      onTap: () {
                        Get.to(KnowingAllahArticalContainScreen(
                          index: index,
                          dataText:
                              controller.searchResult[index].subcategories,
                          itemCount: controller
                              .searchResult[index].subcategories.length,
                        ));
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
