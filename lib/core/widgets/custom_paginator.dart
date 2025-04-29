import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/inkwell_custom.dart';
import 'package:number_paginator/number_paginator.dart';

/// This widget provides a customizable number pagination component for Flutter applications.
/// It efficiently displays a limited subset of data from a larger dataset and allows users
/// to navigate between pages.
/// * Example
/// ```dart
///    CustomPaginator<FixedEntities>(
///           data: controller.offlineArticals,
///           getItemText: (artical) => artical.name,
///           onItemTaped: (item) {
///           Get.to(ArticalCustom(dataText: item.content));
///         },
///       )
/// ```
class CustomPaginator<T> extends StatefulWidget {
  const CustomPaginator({
    super.key,

    /// The complete dataset to be paginated.
    required this.data,

    /// A function that determines how each item's data is presented.
    required this.getItemText,

    /// A function that handles user taps on items in the list.
    required this.onItemTaped,
  });

  /// The complete dataset of type `T` to be displayed with pagination.
  final List<T> data;

  /// A function that takes an item of type `T` and returns a String representing the text to be displayed for that item.
  /// This function allows you to customize how each item's data is presented in the list view.
  final String Function(T item) getItemText;

  /// A function that is called when a user taps on an item in the list.
  /// This function receives the tapped item of type `T` as an argument, allowing you to handle user interaction with the data.
  final Function(T item) onItemTaped;

  @override
  State<CustomPaginator<T>> createState() => _CustomPaginatorState<T>();
}

class _CustomPaginatorState<T> extends State<CustomPaginator<T>> {
  List<T> _currentPageData = [];
  late ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    if (widget.data.isNotEmpty) {
      _currentPageData = (widget.data).take(20).toList();
    }
    super.initState();
  }

  _onPageChanged(int page) {
    pageIndex = page;
    _currentPageData.clear();
    _currentPageData =
        (widget.data).getRange(page * 20, (page * 20) + 20).toList();
    _scrollController.jumpTo(
      0,
    );
    setState(() {});
  }

  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    print((widget.data.length >= 20));
    if (pageIndex == 0 && _currentPageData.isEmpty && widget.data.isNotEmpty) {
      _currentPageData = (widget.data).take(20).toList();
    }
    return Column(
      children: [
        if (widget.data.length >= 20)
          NumberPaginator(
            numberPages: widget.data.length ~/ 20,
            onPageChange: _onPageChanged,
          ),
        Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.all(5),
              itemCount: _currentPageData.length,
              controller: _scrollController,
              itemBuilder: (context, index) {
                return InkwellCustom(
                  catigory: false,
                  dataText: widget.getItemText(_currentPageData[index]),
                  onTap: () => widget.onItemTaped(_currentPageData[index]),
                );
              }),
        )
      ],
    );
  }
}
