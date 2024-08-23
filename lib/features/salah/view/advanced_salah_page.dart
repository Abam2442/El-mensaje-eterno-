import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/custom_appbar.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class AdvancedSalahPage extends StatefulWidget {
  const AdvancedSalahPage({super.key, required this.imgList, required this.title});
  final String title;
  final List<String> imgList;

  @override
  State<AdvancedSalahPage> createState() => _AdvancedSalahPageState();
}

class _AdvancedSalahPageState extends State<AdvancedSalahPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SalahAppbar(title: widget.title,),
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          PhotoViewGallery.builder(
              backgroundDecoration: const BoxDecoration(color: Colors.transparent),
              itemCount: widget.imgList.length,
              builder: (context, index) {
                return PhotoViewGalleryPageOptions(
                    imageProvider: AssetImage(widget.imgList[index]),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.contained * 4);
              },
            onPageChanged: (index)=>setState(() {
              this.index = index;
            }),
          ),
          Container(
            padding: 10.aEdge,
            child: Text('Rak\'ah ${index+1}/${widget.imgList.length}'),
          )
        ],
      ),
    );
  }
}
