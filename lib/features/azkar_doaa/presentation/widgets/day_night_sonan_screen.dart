import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/item%20_card.dart';

import '../../../sites/presentation/widget/app_bar_custom.dart';
import '../controller/azkar_doaa_controller.dart';
import 'day_night_sub_zikr_screen.dart';

class DayNightSonanScreen extends StatelessWidget {
  const DayNightSonanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: 'Súplicas de día y de noche')
          .customAppBar(context),
      body: GetBuilder<AzkarDoaaController>(builder: (c) {
        if (c.sonan == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: c.sonan!.dayAndNightSonan.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(() => BodySonanDayNightSubZikrScreen(
                      dayAndNightSonan: c.sonan!.dayAndNightSonan[index],
                    ));
              },
              child: ItemCard(
                titleSite: c.sonan!.dayAndNightSonan[index].title,
                subtitle: c.sonan!.dayAndNightSonan[index].desc,
                hasCopyRights: false,
              ),
            );
          },
        );
      }),
    );
  }
}
