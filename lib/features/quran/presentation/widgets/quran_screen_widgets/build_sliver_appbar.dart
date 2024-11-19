import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/quran_controller.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/quran_screen_widgets/direction_aware.dart';

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
  final TextEditingController _searchController =
      Get.find<QuranController>().searchController.value;
  final ValueNotifier<bool> _isSearching = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<QuranController>(); // Get the controller instance
    String appBarTitle = widget.title;

    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: widget.backgroundColor,
      leading: !Navigator.canPop(context)
          ? null
          : DirectionAware(
              // من شان تدوير الايقونة بزاوية 90
              //DirectionAware for rotate the icon to other side rtl or ltr
              child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back)),
            ),
      centerTitle: true,
      title: Text(
        appBarTitle,
        style: Styles.textStyle18Godlen,
      ),
      actions: [
        // isSearch == true
        //     ? Padding(
        //         padding: const EdgeInsets.only(right: 20),
        //         child: SvgPicture.asset(
        //           AppAssets.kSearchIcon,
        //           color: iconColor,
        //         ),
        //       )
        //     : const SizedBox(),
        if (widget.isSearch)
          ValueListenableBuilder<bool>(
            valueListenable: _isSearching,
            builder: (context, isSearching, child) {
              return isSearching
                  ? SizedBox(
                      width: 200, // Adjust the width as needed
                      child: TextField(
                        style: Styles.textStyle18White,
                        onChanged: (value) {
                          // Trigger the search function when the text changes
                          controller.search(value);
                        },
                        controller: _searchController,
                        decoration: const InputDecoration(
                          hintText: 'Search...',
                          hintStyle: Styles.textStyle18White,
                        ),
                      ),
                    )
                  : Container();
            },
          ),
        IconButton(
          icon: const Icon(Icons.search, color: Colors.white),
          onPressed: () {
            // Toggle the search TextField visibility when the icon is clicked
            _isSearching.value = !_isSearching.value;
            if (_isSearching.value) {
              // Trigger the search function when the icon is clicked
              controller.search(_searchController.text);
            } else {
              // Clear the search results when the search TextField is hidden
              controller.search('');
            }
          },
        ),

        if (widget.hasTranslator)
          Container(
            color: Colors.red,
            width: 20,
            height: 20,
          )
        // SizedBox(
        //   width: 0.5 * Get.width,
        //   child: GetBuilder<QuranController>(
        //     id: "Translator Select",
        //     builder: (controller) => PrimarySelectItem<int>(
        //       labelText: "Translator",
        //       hintText: "Select",
        //       onChanged: (value) {
        //         controller.selectedTranslator =
        //             value ?? controller.selectedTranslator;
        //         controller.update(["Translator Select", "ayaNonArabic"]);
        //       },
        //       items: const [
        //         DropdownMenuItem<int>(
        //           value: 1,
        //           child: Text('Translator 1'),
        //         ),
        //         DropdownMenuItem<int>(
        //           value: 2,
        //           child: Text('Translator 2'),
        //         ),
        //         DropdownMenuItem<int>(
        //           value: 3,
        //           child: Text('Translator 3'),
        //         ),
        //       ],
        //       selectedItem: controller.selectedTranslator,
        //     ),
        //   ),
        // ),
      ],
      floating: true,
      snap: true,
      elevation: 0,
      pinned: widget.isPinned,
    );
  }
}
