import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/item%20_card.dart';

import '../../../sites/presentation/widget/app_bar_custom.dart';
import '../controller/azkar_doaa_controller.dart';
import 'timed_untimed_body_screen.dart';

class UnTimedSonanScreen extends StatelessWidget {
  const UnTimedSonanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const AppBarCustom(title: 'Súplicas generales').customAppBar(context),
      body: GetBuilder<AzkarDoaaController>(builder: (c) {
        if (c.sonan == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: c.sonan!.notTimedSonan.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(() => BodySonanTimedUnTimedScreen(
                      dayAndNightSonan: c.sonan!.notTimedSonan[index],
                    ));
              },
              child: ItemCard(
                titleSite: c.sonan!.notTimedSonan[index].title,
                subtitle: '',
                hasCopyRights: false,
              ),
            );
          },
        );
      }),
    );
  }
}
