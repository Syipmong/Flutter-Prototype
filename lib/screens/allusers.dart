import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prototype/screens/userslist.dart';

import 'userpage.dart';

// class AllUsers extends StatelessWidget {
//   const AllUsers({super.key});

//   @override
//   State<AllUsers> createState() => _AllUsersState();
// }

class AllUsers extends StatelessWidget{

Widget buildUser(User user) => ListTile(
    leading: CircleAvatar(
      child: Text('${user.age}'),
    ),
    title: Text(user.name),
    subtitle: Text(user.birthday.toIso8601String()),

  );

  
Stream<List<User>> readUsers() => FirebaseFirestore.instance.collection('users').snapshots().map((snapshot) => snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());


   Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    user.id = docUser.id;
    final json = user.toJson();
    await docUser.set(json);
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Users Active'),
      ),
      body: StreamBuilder<List<User>> (
        stream: readUsers(),
        builder: ((context, snapshot) {
          if(snapshot.hasError){
            return Text('Something Went wrong! ${snapshot.error}');
          }else if(snapshot.hasData){
            final users = snapshot.data!;
            
            return ListView(
              children: users.map(buildUser).toList(),
               );
          }
          else{
            return Center(
              child: CircularProgressIndicator()
            );
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => 
          UsersList()));
        },
        child: Icon(Icons.add),
      ),
    );






  }

}