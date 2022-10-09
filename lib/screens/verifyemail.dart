
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prototype/screens/homescreen.dart';

import 'utils.dart';

class VerifyEmailPage extends StatefulWidget {


  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
bool isEmailVerified = false;
bool canResendEmail = false;
Timer? timer;

@override
void initState(){

  super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
 
    if(!isEmailVerified){
      sendVerificationEmail(); 
    
      timer = Timer.periodic(
        Duration(seconds: 3),
        (_) => checkEmailVerified()
      );

    }

}

@override
void dispose(){
  timer?.cancel();

  super.dispose();
}


Future checkEmailVerified() async {
  await FirebaseAuth.instance.currentUser!.reload();
  setState(() {
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
  });

  if (isEmailVerified) timer?.cancel();
}




  Future sendVerificationEmail() async {
    try{
    final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification();
    setState(() => canResendEmail = false );
    await Future.delayed(Duration(seconds: 5));
    setState(() => canResendEmail = true);
  } catch (e) {
    Utils.showSnackBar(e.toString());
  }
  }


  @override
  Widget build(BuildContext context) => isEmailVerified
  ? HomeScreen()
  : Scaffold(
    appBar: AppBar(
      title: Text('Verify your Email'),),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'A Text Email Verification had been sent to your registered email',
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24,),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50)
              ),
              onPressed: canResendEmail ? sendVerificationEmail : sendVerificationEmail,
              icon: Icon(Icons.email,size: 32, ),
              label: Text('Resend Email', style: TextStyle(fontSize: 24),),
            ),
            SizedBox(height: 8,),
            TextButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
              ),
              child: Text(
                'Cancel',
                style: TextStyle(fontSize: 24),

              ),
              onPressed: () => FirebaseAuth.instance.signOut(),
            )
          ],
        ),
      ),
  );
  
}