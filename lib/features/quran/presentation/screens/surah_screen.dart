import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/audio_controls_widget.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/quran_controller.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/surrah_controller.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/aya_container.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/basmala_image.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/tafsirs_picker_widget.dart';
import 'package:hiwayda_oracion_islamica/intial_bindings.dart';


class SurahScreen extends StatefulWidget {
  const  SurahScreen({super.key,this.ayaNumber});


  final int? ayaNumber;

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  var quranController = Get.find<QuranController>();

  var surrahController = Get.find<SurahController>();

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
      _createKeysForlListItems();
   
   _navigateToAyaFromSearch();

   surrahController.setUrl();
    

    
    super.initState();
  }

  void _navigateToAyaFromSearch() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
     if(widget.ayaNumber != null )
     {
      double? size =  surrahController.keys[0]?.currentContext?.size?.height;
      if(size != null)
      {
       await  scrollController.animateTo((widget.ayaNumber! * size), duration: Duration(seconds: 2), curve: Curves.linear);
        final keyContext = surrahController.keys[widget.ayaNumber!-1]?.currentContext;
     if (keyContext != null) {
       Scrollable.ensureVisible(
         keyContext,
         duration: Duration(seconds: 1),
         curve: Curves.easeInOut,
       );
     }
      }
     }
    });
  }

  void _createKeysForlListItems() {
      for (int i = 0; i < quranController.currentAyat.length; i++) {
         surrahController.keys[i] = GlobalKey();
        }
  }

  @override
  Widget build(BuildContext context) {
    surrahController.scrollController = scrollController;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kWhiteColor,
        iconTheme: const IconThemeData(color: AppColors.kPrimaryColor),
        title: Text( quranController.surahs[quranController.currentSurrah-1].name , style: const TextStyle(color: AppColors.kPrimaryColor)),
        actions: [
          TafsirsPickerWidget(
             
            onSave: _saveSelectedTafsirs,
          ),
        ],
      ),
      body: Column(
        children: [
          
          Expanded(
            child:   
            ListView.builder( 
              controller: scrollController,
               
                      itemCount: quranController.currentAyat.length+1,
                      //to make the next widget render if tafisrs text it big
                      // for auto navigation to work
                      cacheExtent: 3000, 
                      itemBuilder: (context, index) {
                        if(index == 0)
                        {
                          return  const Padding(
                            padding: EdgeInsets.symmetric(vertical: 4 , horizontal: 20),
                            child: BasmalaImage(),
                          );
                        }
                        return AyaContainer(

                          key: surrahController.keys[index-1],
                          number: index,
                          ayah: quranController.currentAyat[index-1],
                        );
                      }
                      
                    
                  ),
          ),
           QuranAudioControlsWidget(),
        ],
      ),
    );
  }

  _saveSelectedTafsirs(selectedItems) {
            List<String> tafsirs = [];
            for(var item in selectedItems.keys)
            {
              if(selectedItems[item] == true)
              {
                tafsirs.add(item);
              }
            }
  
            Get.find<QuranController>().updateSelectedTranslator(tafsirs) ;
            
          }

  @override
  void dispose() {
    scrollController.dispose();
    surrahController.stopSound();
    super.dispose();
  }
}

