import 'package:flutter/widgets.dart';

import 'SignUp.dart';
import 'login.dart';

class AuthPage extends StatefulWidget {

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
      bool isLogin = true;


  @override
  Widget build(BuildContext context) => isLogin 
  ? Login(onClickedSignUp : toggle)
  : SignUp(onClickedSignIn : toggle);

  void toggle() => setState(() => isLogin =! isLogin);
  
}