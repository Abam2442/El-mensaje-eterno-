import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/data/local/local_data.dart';
import 'package:hiwayda_oracion_islamica/features/splash/screen/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/ys_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const supabaseUrl = 'https://gamfxtidrkzfpasgqfwf.supabase.co';
const supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdhbWZ4dGlkcmt6ZnBhc2dxZndmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzIxODU5MTEsImV4cCI6MjA0Nzc2MTkxMX0.Vw2lhSv92fM3CEiHTE62KuBAw8jd8bx6OaoaJBT8JYQ';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://gamfxtidrkzfpasgqfwf.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdhbWZ4dGlkcmt6ZnBhc2dxZndmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzIxODU5MTEsImV4cCI6MjA0Nzc2MTkxMX0.Vw2lhSv92fM3CEiHTE62KuBAw8jd8bx6OaoaJBT8JYQ',
  );
  final SharedPreferences pref = await SharedPreferences.getInstance();
  Get.put(pref);
  await LocalData.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const YsMaterialApp(
      title: 'El Mensaje Eterno',
      home: SplashPage(),
    );
  }
}
