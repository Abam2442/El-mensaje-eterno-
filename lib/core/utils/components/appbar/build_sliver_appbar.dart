import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../styles/text_styles.dart';

class SliverAppBarWidget extends StatefulWidget {
  final bool isSearch;
  final Color backgroundColor;
  final Color iconColor;
  final bool isPinned;
  final String title;
  final bool hasTranslator;

  const SliverAppBarWidget({
    super.key,
    this.isSearch = false,
    this.backgroundColor = AppColors.kPrimaryColor,
    this.iconColor = AppColors.kWhiteColor,
    this.title = '',
    this.isPinned = false,
    this.hasTranslator = false,
  });

  @override
  State<SliverAppBarWidget> createState() => _SliverAppBarWidgetState();
}

class _SliverAppBarWidgetState extends State<SliverAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    String appBarTitle = widget.title;

    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: widget.backgroundColor,
      centerTitle: true,
      title: Text(
        appBarTitle,
        style: Styles.textStyle18Godlen,
      ),
      floating: true,
      snap: true,
      elevation: 0,
      pinned: widget.isPinned,
    );
  }
}
