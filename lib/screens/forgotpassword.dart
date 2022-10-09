import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'utils.dart';
class ForgotPassword extends StatefulWidget {
  

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}




class _ForgotPasswordState extends State<ForgotPassword> {

final formKey = GlobalKey<FormState>();
final emailController = TextEditingController();

@override
void dispose(){
  emailController.dispose();

  super.dispose();
}

  @override
  Widget build(BuildContext context) =>  Material(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 60,),
              //FlutterLogo(size: 120,),
               CircleAvatar(
                radius: 52,
                backgroundImage: AssetImage('assets/images/icon.png'),
              ),
              SizedBox(height: 20,),
              Text('Hey There Welcome to My App',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 40.0,),
              TextFormField(
                controller: emailController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(labelText: 'Email'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) => email != null && !EmailValidator.validate(email)
                ? 'Enter a Valid Email'
                : null,
              ),
              SizedBox(height: 4.0,),
              
              SizedBox(height: 20.0,),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                   minimumSize: Size.fromHeight(50),
                ),
                icon: Icon(Icons.lock_open_outlined,),
                label: Text('Reset Password',
                style: TextStyle(fontSize: 24),),
                onPressed: resetPassword,
        
              ),
              SizedBox(height: 24,),
            ],
          ),
      ),
    ),
  );




  Future resetPassword() async {

showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context)=> Center(child: CircularProgressIndicator(),)
        );

    try{
  await FirebaseAuth.instance.sendPasswordResetEmail(
      email: emailController.text.trim());

      Utils.showSnackBar('Password reset Sucessfully');
      Navigator.of(context).popUntil((route) => route.isFirst);
      } on FirebaseAuthException catch(e){
        print(e);
        Utils.showSnackBar(e.message);
        Navigator.of(context).pop();
      }
  }
}
