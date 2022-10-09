import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';
import 'package:async/async.dart';
import 'package:intl/intl.dart';

import 'userpage.dart';


class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();
  final controllerDate = TextEditingController();
  final format = DateFormat("yyyy-MM-dd ");
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
            TextFormField(
              controller: controllerName,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16,),
            TextFormField(
              controller: controllerAge,
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
             
              ),
              keyboardType: TextInputType.number,
              
            ),
            SizedBox(height: 16,),
            TextFormField(
              controller: controllerDate,
              decoration: InputDecoration(
                labelText: 'Birthday',
                border: OutlineInputBorder(),
              ),
              //keyboardType: TextInputType.number,
            ),
            SizedBox(height: 32,),
          ElevatedButton(
            onPressed: (){
              final user = User(
                name: controllerName.text,
                age: int.parse(controllerAge.text),
                birthday: DateTime.parse(controllerDate.text)
                );
                createUser(user);
              Navigator.pop(context);
          },
          child: Text('Create'),
          )
             
      ],
      ),
    );

Stream<List<User>> readUsers() => FirebaseFirestore.instance.collection('users').snapshots().map((snapshot) => snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());


   Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    user.id = docUser.id;
    final json = user.toJson();
    await docUser.set(json);
   }
   
}
    //   body:  ListView(
    //     padding: EdgeInsets.all(16),
    //     children: [
    //       TextField(
    //         controller: controllerName,
    //         decoration: decoration('Name'),
    //       ),
    //       SizedBox(height: 24,),
    //       TextField(
    //         controller: controllerAge,
    //         //decoration: decoration('Age'),
    //         keyboardType: TextInputType.number,
    //       ),
    //       SizedBox(height: 24,),
    //       DateTimeField(
    //         controller: controllerDate,
    //         decoration: decoration('Birthdate'),
    //         format: DateFormat('yyyy-mm-dd'),
    //         onShowPicker:(context, currentValue) =>
    //         context: context ,
    //         firstDate: DateTime(1900),
    //         lastDate: DateTime(2100),
    //         initialDate: currentValue ?? DateTime.null,
    //       ),
    //       SizedBox(height: 32,),
    //       ElevatedButton(
    //         onPressed: (){
    //           Navigator.pop(context)
    //       },
    //       child: Text('Create'),
    //       )
          
    //     ],
    //   ),
    // );
 