import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/tafsirs_keys.dart';
import 'package:hiwayda_oracion_islamica/core/services/shared_preferences_service.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/surah_screen_widgets/main_button.dart';

class TafsirsPickerWidget extends StatelessWidget {
  final Function(Map<String, bool>) onSave;

  const TafsirsPickerWidget({super.key, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: false,
          builder: (context) => TafsirPcikerList(onSave: onSave),
        );
      },
      icon: const Icon(Icons.translate),
    );
  }
}

class TafsirPcikerList extends StatefulWidget {
  final Function(Map<String, bool>) onSave;

  const TafsirPcikerList({super.key, required this.onSave});

  @override
  _TafsirPcikerListState createState() => _TafsirPcikerListState();
}

class _TafsirPcikerListState extends State<TafsirPcikerList> {
  Map<String, bool> selectedTafsirs = {};

  final sharedPreferencesService = Get.find<SharedPreferencesService>();

  @override
  void initState() {
    super.initState();
    _loadSelectedTafsirs();
  }

  _loadSelectedTafsirs() async {
    setState(() {
      for (var tafsir in TafsirKeys.tafsirs) {
        selectedTafsirs[tafsir] =
            sharedPreferencesService.getData<bool>(key: tafsir) ?? false;
      }
    });
  }

  _saveSelectedTafsirs() async {
    selectedTafsirs.forEach((tafsir, isSelected) {
      sharedPreferencesService.setData(key: tafsir, value: isSelected);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            trailing: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: TafsirKeys.tafsirs.map((tafsir) {
                return CheckboxListTile(
                  title: Text(tafsir),
                  value: selectedTafsirs[tafsir],
                  onChanged: (bool? value) {
                    setState(() {
                      selectedTafsirs[tafsir] = value!;
                    });
                  },
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: MainButton(
              onPressed: () {
                _saveSelectedTafsirs();
                widget.onSave(selectedTafsirs);
              },
              child: const Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
