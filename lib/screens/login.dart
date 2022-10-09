
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:prototype/screens/forgotpassword.dart';

import '../main.dart';


class Login extends StatefulWidget {
  // const Login({super.key});
  final VoidCallback onClickedSignUp;

   Login({
    Key? key, 
    required this.onClickedSignUp,
    }) : super(key: key);

  final emailController = TextEditingController();
final passwordController = TextEditingController();

  





  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
////////////////final
final emailController = TextEditingController();
final passwordController = TextEditingController();

//dispose()
@override
void dispose(){
  emailController.dispose();
  passwordController.dispose();


  super.dispose();
}

  @override
  Widget build(BuildContext context) =>  Material(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
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
              Text('Hey There Welcome Back',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold
              ),),
            SizedBox(height: 40.0,),
            TextField(
              controller: emailController,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 4.0,),
            TextField(
              controller: passwordController,
              textInputAction: TextInputAction.done,
              cursorColor: Colors.white,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20,),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                 minimumSize: Size.fromHeight(50),
              ),
              icon: Icon(Icons.lock_open_outlined,),
              label: Text('Sign In',
              style: TextStyle(fontSize: 24),),
              onPressed: SignIn,
  
            ),
            SizedBox(height: 16,),
            GestureDetector(
              child: Text('Forgot Password',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 20,
              ),),
              onTap: ()=> Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ForgotPassword(),
                )),
            ),
            SizedBox(height: 16,),

            RichText(
              text: TextSpan(
                  style: TextStyle(color: Colors.red, fontSize: 20),
                  text: 'No Account?  ',
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickedSignUp,
                      text: 'Sign Up',
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
  );








    Future SignIn() async {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context)=> Center(child: CircularProgressIndicator(),)
        );
      try {
  await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
  );
} on FirebaseAuthException catch (e) {
  // TODO
  print(e);
        }
        navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }


  }
