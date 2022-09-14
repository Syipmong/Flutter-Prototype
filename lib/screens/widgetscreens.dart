import 'package:flutter/material.dart';

class WidgetScreens extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Notification();
  }
}


class Notification extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('Notifications'),
    ),);
  }
}

class Favourite extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites'),
      ),
    );
  }
}