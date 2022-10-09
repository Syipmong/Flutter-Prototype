import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prototype/screens/allusers.dart';
import 'package:prototype/screens/userslist.dart';
import 'package:prototype/screens/widgetscreens.dart';
import 'files.dart';
import 'userpage.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 2;

  final screens = [
    Files(),
    Download(),
    Fire(),
    Upload(),
    Folders()
  ];

  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser!;
    final items = <Widget>[
      Icon(Icons.home, size: 30,),
      Icon(Icons.search, size: 30),
      Icon(Icons.favorite, size: 30,),
      Icon(Icons.settings, size: 30),
      Icon(Icons.person, size: 30,)
    ]; 
    final user = FirebaseAuth.instance.currentUser!;
    return Container(
      color: Colors.blue,
      child: SafeArea(
        top: false,
        child: Container(
          child: Scaffold(
            extendBody: true,
          //   appBar: AppBar(
          //     title: Text('Home'),
          //     actions: [
          //       IconButton(
          //       icon: Icon(Icons.settings),
          //   onPressed: () {
          //         Navigator.pushNamed(context, '/settings');
          // },
          // tooltip: 'Settings',
          // color: Colors.blue,
          //   ),
          //   IconButton(
          //     onPressed: (){},
          //   icon: Icon(Icons.login),
          //   tooltip: 'LogOut',
          //   color: Colors.blue,
          //   )
          //     ],
          //   ),
            // drawer: NavigationDrawer(),
            
            body:Center(
              child: screens[index],
),
            
           bottomNavigationBar: Theme(
            key: navigationKey,
              data: Theme.of(context).copyWith(
                iconTheme: IconThemeData(color: Colors.blue)
              ),
             child: CurvedNavigationBar(
              color: Color.fromARGB(255, 37, 40, 42),
              buttonBackgroundColor: Color.fromARGB(255, 29, 27, 27),
              backgroundColor: Colors.transparent,
              height: 60,
              animationCurve: Curves.easeInOut,
              animationDuration: Duration(milliseconds: 300),
              index: index,
              items: items,
              onTap: (index) => setState(() => this.index = index),
               ),
           ),
           ),
        ),
      ),
    );
  }
}

///////////////////////////////////////////////

class NavigationDrawer extends StatelessWidget{

  @override
  Widget build(BuildContext context) =>
    Drawer(
      backgroundColor: Colors.blue,
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


Widget buildHeader(BuildContext context){
  final user = FirebaseAuth.instance.currentUser!;
  
  return Material(
    color: Color.fromARGB(255, 82, 76, 76),
    
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
          Text('@Undefined',
          style: TextStyle(color: Colors.white, fontSize: 16.0),),
          Text('No Name',
          style: TextStyle(fontSize: 28.0, color: Colors.white),),
          Text(user.email!,
          style: TextStyle(fontSize: 16.0, color: Colors.white),)
        ]),
      ),
    ),
  );
}
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
            builder: (context) => AllUsers(),
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












// ////Removed Widget from Body
// ///Padding(
//         padding: EdgeInsets.all(60),
//         child: Column(
//           children: [
//             Text('Signed In as',
//             style: TextStyle(fontSize: 16),),
//             SizedBox(height: 8,),
//             Text(user.email!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
//             SizedBox(height: 40,),
//             ElevatedButton.icon(
//               icon: Icon(Icons.arrow_back),
//               label: Text('Sign Out'),
//               onPressed: ()=> FirebaseAuth.instance.signOut()
//             )
//           ],
//         ),
//       ),