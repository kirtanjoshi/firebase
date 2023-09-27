import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebaseloginseries/firebase_options.dart';
import 'package:get/get.dart';


import 'Part 2 ,test file/features/screens/login_Screens/login_Page.dart';
import 'Part 2 ,test file/features/screens/splash_Screen/splash_screen.dart';



void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
  //     .then((value) => Get.put(AuthenticationRepository()));
  WidgetsFlutterBinding.ensureInitialized();
   Firebase.initializeApp();
  runApp(
    MaterialApp(
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.light,
      home:splash_Screen(),
    ),
  );
}