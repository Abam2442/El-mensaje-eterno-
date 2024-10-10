import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/primary_list_tile.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/albukhary_muslim_screens/albukhary_muslim_final_screen.dart';

class AlbikharyMuslimSecondScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  const AlbikharyMuslimSecondScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: data['Aboab'].length,
        itemBuilder: (context, index) {
          return PrimaryListTile(
              itemNumber: index + 1,
              es: data['Aboab'][index]['Bab Name'],
              ar: '',
              isSaved: false,
              onTap: () {
                Get.to(() => AlbukharyMuslimFinalScreen(
                      data: data['Aboab'][index]['Ahadith'],
                    ));
              });
        },
      ),
    );
  }
}
