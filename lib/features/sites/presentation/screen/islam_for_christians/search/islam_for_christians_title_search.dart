import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/islam_for_christians_controller.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/artical_custom.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/inkwell_custom.dart';

class IslamForChristiansTitleSearch extends StatelessWidget {
  final List dataText;
  const IslamForChristiansTitleSearch({super.key, required this.dataText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: "Islam For Christians")
          .customAppBar(context),
      body: GetBuilder<IslamForChristiansControllerImp>(
        builder: ((controller) => Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: controller.searchResult.length,
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
