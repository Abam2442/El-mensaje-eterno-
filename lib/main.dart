import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/features/splash/screen/splash_page.dart';
import 'package:hiwayda_oracion_islamica/ys_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://gamfxtidrkzfpasgqfwf.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdhbWZ4dGlkcmt6ZnBhc2dxZndmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzIxODU5MTEsImV4cCI6MjA0Nzc2MTkxMX0.Vw2lhSv92fM3CEiHTE62KuBAw8jd8bx6OaoaJBT8JYQ',
  );
  final SharedPreferences pref = await SharedPreferences.getInstance();
  Get.put(pref);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  YsMaterialApp(
      title: 'El Mensaje Eterno',
      home:const SplashPage(),
      theme: ThemeData(
        scaffoldBackgroundColor:AppColors.kPrimaryColor ,
      ),
    );
  }
}
