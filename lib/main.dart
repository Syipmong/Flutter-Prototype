import 'package:flutter/material.dart';

import 'screens/homescreen.dart';
import 'screens/login.dart';
import 'screens/settings.dart';
//import 'package:native_notify/native_notify.dart';

import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';


//void main() {
 // WidgetsFlutterBinding.ensureInitialized();
 // NativeNotify.initialize(1722, 'D28lq5UJ8Yv36EB1cXkfML', null, null);

// await Firebase.initializeApp(
//   options: DefaultFirebaseOptions.currentPlatform,
// );

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
/*
This is the firebase initializer for the firebase firestore in the database
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  */

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,

      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_)=> HomeScreen(),
        '/settings': (_)=> SettingScreen(),
        '/login': (_)=> Login(),

      },
    );
  }
}

