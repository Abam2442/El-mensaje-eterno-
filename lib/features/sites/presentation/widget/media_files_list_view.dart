import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/view_or_download_inkwell.dart';

class MediaFilesListView extends StatelessWidget {
  const MediaFilesListView(
      {super.key,
      required this.title,
      required this.data,
      this.fileType,
      this.mediaLinkType = MediaLinkType.viewAndDownload});
  final String title;
  final List<MediaEntity> data;
  final String? fileType;
  final MediaLinkType mediaLinkType;
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
                return ViewOrDownloadInkwell(
                  url: data[index].url,
                  name: data[index].name,
                  fileType: fileType ?? "",
                  mediaLinkType: mediaLinkType,
                );
              })),
    );
  }
}
