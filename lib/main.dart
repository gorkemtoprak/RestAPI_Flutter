import 'package:flutter/material.dart';
import 'package:rest_api/utils/themes/themes.dart';

import 'view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyThemes.lightMode,
      darkTheme: MyThemes.darkMode,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
