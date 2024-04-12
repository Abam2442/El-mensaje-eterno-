import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/advanced_learning/presentation/widgets/item%20_card.dart';

import '../../../sites/presentation/widget/app_bar_custom.dart';
import '../controller/azkar_doaa_controller.dart';
import 'timed_untimed_body_screen.dart';

class TimedSonanScreen extends StatelessWidget {
  const TimedSonanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: 'سنن موقوتة').customAppBar(context),
      body: GetBuilder<AzkarDoaaController>(builder: (c) {
        if (c.sonan == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: c.sonan!.timedSonan.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(() => BodySonanTimedUnTimedScreen(
                      dayAndNightSonan: c.sonan!.timedSonan[index],
                    ));
              },
              child: Item_Card(
                titleSite: c.sonan!.timedSonan[index].title,
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
