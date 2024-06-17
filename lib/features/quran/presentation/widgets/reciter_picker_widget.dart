
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/constants/reciters_urls.dart';
import 'package:hiwayda_oracion_islamica/core/services/shared_preferences_service.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/surrah_controller.dart';

class ReciterPickerWidget extends StatefulWidget {
  const ReciterPickerWidget({super.key});

  @override
  _ReciterPickerWidgetState createState() => _ReciterPickerWidgetState();
}

 
class _ReciterPickerWidgetState extends State<ReciterPickerWidget> {
 

  String? selectedReciter;
 
  late List<String> reciterNames;

  final sharedPreferencesService = Get.find<SharedPreferencesService>();

  final surahController = Get.find<SurahController>();

  @override
  void initState() {
   reciterNames =  RecitersUrls.reciters.keys.toList();
    super.initState();
    _loadSelectedReciter();
  }

  _loadSelectedReciter() async {
    
    setState(() {
      selectedReciter = sharedPreferencesService.getData<String>(key: AppKeys.selectedReciter) ?? RecitersUrls.defaultReciter;
       
    });
  }

  _saveSelectedReciter(String reciter) async {
    await sharedPreferencesService.setData(key: AppKeys.selectedReciter, value: reciter);

    surahController.selectedReciter.value  = reciter ;
   
  }

  _showReciterPicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView.builder(
          itemCount: reciterNames.length,
          itemBuilder: (context, index) {
            
            return ListTile(
              title: Text(reciterNames[index]),
              onTap: () {
                setState(() {
                  selectedReciter = reciterNames[index];
                  
                });
                _saveSelectedReciter(reciterNames[index]);
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      _showReciterPicker();
      },
      child: Container(
        constraints: const BoxConstraints(maxHeight: 60),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(border: Border.all(color: AppColors.white, width: 0.5),
        borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Row(
         
          children: [
              const Icon(Icons.person_rounded, color: Colors.white,),
              const SizedBox(width: 8,),
            Expanded(
              child: Text(
                selectedReciter ?? 'No Reciter Selected',overflow: TextOverflow.fade,
                style: const TextStyle(fontSize: 18,color: Colors.white),
              ),
            ),
          
          ],
        ),
      ),
    );
    
  }
}
