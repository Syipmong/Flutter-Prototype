
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'utils.dart';

class SignUp extends StatefulWidget {
  

   final VoidCallback onClickedSignIn;

   SignUp({
    Key? key, 
    required this.onClickedSignIn,
    }) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
final formKey = GlobalKey<FormState>();
final emailController = TextEditingController();
final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) => Material(
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
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: 'Email'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) => email != null && !EmailValidator.validate(email)
                ? 'Enter a Valid Email'
                : null,
              ),
              SizedBox(height: 4.0,),
              TextFormField(
                controller: passwordController,
                textInputAction: TextInputAction.done,
                cursorColor: Colors.white,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: ((value) => value != null && value.length < 6 
                ? 'Enter min. 6 characters'
                : null
              ),),
              SizedBox(height: 20.0,),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                   minimumSize: Size.fromHeight(50),
                ),
                icon: Icon(Icons.lock_open_outlined,),
                label: Text('Sign Up',
                style: TextStyle(fontSize: 24),),
                onPressed: SignUp,
        
              ),
              SizedBox(height: 24,),
              RichText(
                text: TextSpan(
                    style: TextStyle(color: Colors.red, fontSize: 20),
                    text: 'Have an account?  ',
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedSignIn,
                        text: 'Login',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Theme.of(context).colorScheme.secondary
                        )
                      )
                    ]
              ))
            ],
          ),
      ),
    ),
  );




  Future SignUp() async {

        final isValid = formKey.currentState!.validate();
        if(!isValid) return;

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context)=> Center(child: CircularProgressIndicator(),)
        );
      try {
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
  );
} on FirebaseAuthException catch (e) {
  // TODO
  print(e);


        Utils.showSnackBar(e.message);

        }
        navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }

}