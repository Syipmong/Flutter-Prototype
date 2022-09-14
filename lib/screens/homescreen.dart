import 'package:flutter/material.dart';
import 'package:prototype/screens/userslist.dart';
import 'package:prototype/screens/widgetscreens.dart';

import 'login.dart';
import 'userpage.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
          icon: Icon(Icons.settings),
      onPressed: () {
            Navigator.pushNamed(context, '/settings');
    },
      ),
      IconButton(
        onPressed: (){
        Navigator.pushNamed(context, '/login');
      },
      icon: Icon(Icons.login),
      )
        ],
      ),
      drawer: NavigationDrawer(),
      body: Container(),
     bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.shifting,
        // selectedItemColor: Colors.red,
        // selectedFontSize: 20.0,
        // selectedIconTheme: IconThemeData(color: Colors.red, size: 40.0),
        // selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        // unselectedIconTheme: IconThemeData(color: Colors.red),
        // unselectedItemColor: Colors.red,
        
        items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
        label: 'Profile'),
        BottomNavigationBarItem(
          icon: Icon(Icons.group),
        label: 'Users'),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
        label: 'Message'), 
       ]),
     );
  }
}

class NavigationDrawer extends StatelessWidget{

  @override
  Widget build(BuildContext context) =>
    Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItems(context),
        ]),
      ),
    );
  

}


Widget buildHeader(BuildContext context)=>
  Material(
    color: Colors.red.shade700,
    
    child: InkWell(
      onTap: (){
        Navigator.pop(context);

          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => UserPage(),
            ));
      },
      child: Container(
        //color: Colors.red.shade700,
        padding: EdgeInsets.only(
          top:24 + MediaQuery.of(context).padding.top,
          bottom: 24,
        ),
        child: Column(children: [
          CircleAvatar(
            radius: 52,
            backgroundImage: NetworkImage(
              'https://blob.sololearn.com/avatars/5d22e885-353c-4850-956d-493a240559ab.jpg'
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Text('@syipmong',
          style: TextStyle(color: Colors.white, fontSize: 16.0),),
          Text('Yipmong Said',
          style: TextStyle(fontSize: 28.0, color: Colors.white),),
          Text('Syipmong5@gmail.com',
          style: TextStyle(fontSize: 16.0, color: Colors.white),)
        ]),
      ),
    ),
  );
Widget buildMenuItems(BuildContext context)=>
  Container(
    padding: EdgeInsets.all(24.0),
    child: Wrap(
      runSpacing: 16.0,
      children: [
        ListTile(
          leading: Icon(Icons.home_outlined),
          title:Text('Home') ,
          onTap:() {
          Navigator.pop(context);

          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Login(),
            ));
            },
            ),

        ListTile(
          leading: Icon(Icons.favorite_outline),
          onTap:(){
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> UsersList()));
          } ,
          title:Text('Favourite') ,
        ),
        ListTile(
          leading: Icon(Icons.workspaces_outlined),
          onTap:(){} ,
          title:Text('Workflow') ,
        ),
        ListTile(
          leading: Icon(Icons.update),
          onTap:(){} ,
          title:Text('Updates') ,
        ),
        Divider(color: Colors.black54,),
        ListTile(
          leading: Icon(Icons.account_tree_outlined),
          onTap:(){} ,
          title:Text('Plugins') ,
        ),
        ListTile(
          leading: Icon(Icons.notifications_outlined),
          onTap:(){
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> WidgetScreens()));
          } ,
          title:Text('Notifications') ,
        ),
        ListTile(
          leading: Icon(Icons.settings_outlined),
          onTap:(){} ,
          title:Text('Settings') ,
        )
      ],
    ),
  );






