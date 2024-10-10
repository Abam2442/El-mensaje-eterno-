import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/saber_el_islam_model.dart';
import '../../controller/saber_el_islam_controller.dart';
import '../../widget/app_bar_custom.dart';
import '../../widget/artical_custom.dart';
import '../../widget/inkwell_custom.dart';

class SaberElIslamArticalListScreen extends StatelessWidget {
  final List<SEIArtical> articals;
  final String name;
  const SaberElIslamArticalListScreen(
      {super.key, required this.articals, required this.name});

  @override
  Widget build(BuildContext context) {
    Get.put(SaberElIslamControllerImp());
    return Scaffold(
      appBar: AppBarCustom(title: name).customAppBar(context),
      body: GetBuilder<SaberElIslamControllerImp>(builder: (controller) {
        if (controller.articals.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: ListView.builder(
                padding: const EdgeInsets.all(5),
                itemCount: articals.length,
                itemBuilder: (context, index) {
                  return InkwellCustom(
                    catigory: false,
                    dataText: articals[index].title,
                    onTap: () {
                      Get.to(() => ArticalCustom(
                            dataText: articals[index].artical,
                          ));
                    },
                  );
                }));
      }),
    );
  }
}
