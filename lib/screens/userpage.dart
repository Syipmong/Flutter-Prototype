//import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget{
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) =>
  Scaffold(
    appBar: AppBar(
      title: TextField(controller: controller,),
      actions: [
        IconButton(
          onPressed: (){
            final name = controller.text;

            createUser(name: name);
          }, 
          icon: Icon(Icons.add))
      ],
    ),
  );



Future createUser ({required String name}) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc();

  final user = User(
    id: docUser.id,
    name: name,
    age: 15,
    birthday: DateTime(2005, 7, 19),

  );
  final json = user.toJson();


  await docUser.set(json);
}

}

class User {
  String id;
  final String name;
  final int age;
  final DateTime birthday;


User({
  this.id = '',
  required this.name,
  required this.age,
  required this.birthday,
    });

    Map<String, dynamic> toJson() => {
      'id': id,
      'name': name,
      'age': age,
      'birthday': birthday,
    };
    static User fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      birthday: (json['birthday'] as Timestamp).toDate(),
    );
}