import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/search_field_widget.dart';
import '../../../domain/entities/fixed_entities.dart';
import '../../controller/islam_for_christians_controller.dart';
import '../../widget/app_bar_custom.dart';
import '../../widget/artical_custom.dart';
import '../../widget/inkwell_custom.dart';

class IslamForChristiansTitleScreen extends StatelessWidget {
  final int itemCount;
  final List<FixedEntities> dataText;
  final int index;
  const IslamForChristiansTitleScreen({
    super.key,
    required this.itemCount,
    required this.dataText,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(IslamForChristiansControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: "Islam For Christians")
          .customAppBar(context),
      body: GetBuilder<IslamForChristiansControllerImp>(
        builder: ((controller) => Column(
              children: [
                SearchFieldWidget(
                  text: 'Buscar en artículos',
                  formState: controller.secondFormState,
                  onSubmitted: (val) => controller.searchFun(
                      val, controller.articals[index].subCatigory, true),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: itemCount,
                    itemBuilder: (context, index) {
                      return InkwellCustom(
                        catigory: false,
                        dataText: dataText[index].name,
                        onTap: () {
                          Get.to(ArticalCustom(
                            dataText: dataText[index].content,
                          ));
                        },
                      );
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
