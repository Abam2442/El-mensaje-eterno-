import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/inkwell_custom.dart';
import 'package:url_launcher/url_launcher.dart';

class ExternalLiksListView extends StatelessWidget {
  const ExternalLiksListView(
      {super.key, required this.title, required this.data});
  final String title;
  final List<FixedEntities> data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(title: title).customAppBar(context),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: ListView.builder(
              padding: const EdgeInsets.all(5),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return InkwellCustom(
                  catigory: false,
                  dataText: data[index].name,
                  onTap: () async {
                    //TODO repleace by flutter-download or flutter-webview
                    await launchUrl(
                      Uri.parse(data[index].content),
                      mode: LaunchMode.inAppBrowserView,
                    );
                  },
                );
              })),
    );
  }
}
