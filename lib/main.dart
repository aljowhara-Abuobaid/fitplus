import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitplus/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/route_manager.dart';
import 'screens/login&register/login.dart';
import 'screens/splash_screens/splash_screens.dart';

// ignore: unused_import
import 'screens/home/homeGym.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen()
    
  ),);
}