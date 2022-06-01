import 'package:audio_video_call/utils/binding.dart';
import 'package:audio_video_call/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'constants/custom_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SettingsView(),
      home: const HomeScreen(),
      // home: AddAttendancePage(),
      initialBinding: Binding(),
      locale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      theme: ThemeData(
          scaffoldBackgroundColor: CustomColors.backgroundColor,
          fontFamily: 'Main'
      ),
    );
  }
}
