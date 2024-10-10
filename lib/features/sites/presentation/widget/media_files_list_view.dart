import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/view_or_download_inkwell.dart';
import 'package:number_paginator/number_paginator.dart';

/// This widget displays a list of media files with an optional pagination functionality.

class MediaFilesListView extends StatelessWidget {
  /// Creates a MediaFilesListView widget.
  const MediaFilesListView({
    super.key,
    required this.title,
    required this.data,
    this.fileType,
    this.mediaLinkType = MediaLinkType.viewAndDownload,
    bool? usePaginator,
  }) : _usePaginator = usePaginator ?? data.length >= 40;

  /// The title to be displayed above the list view.
  final String title;

  /// A list of [MediaEntity] objects representing the media files.
  final List<MediaEntity> data;

  /// The file extension of the media files (e.g., "pdf", "mp3"). This helps determine appropriate UI elements for each file type.
  final String? fileType;

  /// Determines how to handle media links (view or download) and potentially media playback for some types.
  ///
  /// Chose one of [MediaLinkType] valus :
  /// ```dart
  /// [MediaLinkType.viewAndDownload, MediaLinkType.downloadOnly, MediaLinkType.viewOnly, MediaLinkType.downloadAndListen, MediaLinkType.video]
  /// ```
  /// Default is [MediaLinkType.viewAndDownload].
  final MediaLinkType mediaLinkType;

  /// Controls whether to use number pagination or not. Defaults is `true`.
  final bool _usePaginator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(title: title).customAppBar(context),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          if (_usePaginator)
            _PaginatorListBuilder(
              data: data,
              fileType: fileType,
              mediaLinkType: mediaLinkType,
            )
          else
            _MediaFilesListViewWidgetList(
              currentPageData: data,
              fileType: fileType,
              mediaLinkType: mediaLinkType,
              usePaginator: false,
            ),
        ],
      ),
    );
  }
}

class _PaginatorListBuilder extends StatefulWidget {
  const _PaginatorListBuilder({
    required this.data,
    this.fileType,
    this.mediaLinkType = MediaLinkType.viewAndDownload,
  });
  final List<MediaEntity> data;
  final String? fileType;
  final MediaLinkType mediaLinkType;

  @override
  State<_PaginatorListBuilder> createState() => __PaginatorListBuilderState();
}

class __PaginatorListBuilderState extends State<_PaginatorListBuilder> {
  List<MediaEntity> _currentPageData = [];
  late ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    if (widget.data.isNotEmpty) {
      _currentPageData = widget.data.take(20).toList();
    }
    super.initState();
  }

  _onPageChanged(int page) {
    pageIndex = page;
    _currentPageData.clear();
    _currentPageData =
        widget.data.getRange(page * 20, (page * 20) + 20).toList();
    _scrollController.jumpTo(
      0,
    );
    setState(() {});
  }

  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    if (pageIndex == 0 && _currentPageData.isEmpty && widget.data.isNotEmpty) {
      _currentPageData = widget.data.take(20).toList();
    }
    return Expanded(
      child: Column(
        children: [
          NumberPaginator(
            numberPages: widget.data.length ~/ 20,
            onPageChange: _onPageChanged,
            showPrevButton: false,
            showNextButton: false,
          ),
          _MediaFilesListViewWidgetList(
            currentPageData: _currentPageData,
            usePaginator: true,
            fileType: widget.fileType,
            mediaLinkType: widget.mediaLinkType,
            scrollController: _scrollController,
          ),
        ],
      ),
    );
  }
}

class _MediaFilesListViewWidgetList extends StatelessWidget {
  const _MediaFilesListViewWidgetList(
      {required this.currentPageData,
      this.usePaginator = false,
      this.fileType,
      this.mediaLinkType,
      this.scrollController});

  final List<MediaEntity> currentPageData;
  final String? fileType;
  final MediaLinkType? mediaLinkType;
  final bool usePaginator;
  final ScrollController? scrollController;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          controller: scrollController,
          padding: const EdgeInsets.all(5),
          itemCount: currentPageData.length,
          itemBuilder: (context, index) {
            return ViewOrDownloadInkwell(
              url: currentPageData[index].url,
              name: currentPageData[index].name,
              fileType: fileType ?? "",
              mediaLinkType: mediaLinkType,
            );
          }),
    );
  }
}
