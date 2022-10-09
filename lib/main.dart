import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prototype/screens/verifyemail.dart';

import 'screens/authpage.dart';
import 'screens/homescreen.dart';
import 'screens/settings.dart';



import 'package:firebase_core/firebase_core.dart';

import 'screens/utils.dart';

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
final navigatorKey = GlobalKey<NavigatorState>();
// final messengerKey = GlobalKey<ScaffoldMessengerState>();
/*
This is the firebase initializer for the firebase firestore in the database
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  */

class MyApp extends StatelessWidget {
final emailController = TextEditingController();
final passwordController = TextEditingController();




  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) =>
     MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
      // home: HomeScreen(),  
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,

      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_)=> StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges() ,
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError){
              return Center(child: Text('Something Went Wrong'),);
            }
            else if(snapshot.hasData){
              return VerifyEmailPage();
            }else{
              return AuthPage();
            }
          },
        
        ),
        '/settings': (_)=> SettingScreen(),
        '/login': (_)=> AuthPage(),

      },
    );
  }


