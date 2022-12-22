import 'package:booklyapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/splash/data/presentation/view/splash_view.dart';


void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // هنا قمت بجعل كل التطبيق بهذا اللون
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kprimryColors),
      home: SplashView(),
    );
  }
}
