import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/albukhary_muslim_screens/custom_hadith_container.dart';

class AlbukharyMuslimFinalScreen extends StatelessWidget {
  final List data;
  const AlbukharyMuslimFinalScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index) {
          return CustomHadithContainer(hadith: data[index]);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: data.length,
      ),
    );
  }
}
