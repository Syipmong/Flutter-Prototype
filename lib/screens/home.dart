// import 'dart:ffi';
// import 'dart:html';

// import 'package:flutter/material.dart';

// class HomeFab extends StatefulWidget {
//   const HomeFab({super.key});

//   @override
//   State<HomeFab> createState() => _HomeFabState();
// }

// class _HomeFabState extends State<HomeFab> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: CircularFabWidget(),
//       ),
//     );
//   }
// }

// final double buttonSize = 80;

// class CircularFabWidget extends StatefulWidget {
//   const CircularFabWidget({super.key});

//   @override
//   State<CircularFabWidget> createState() => _CircularFabWidgetState();
// }

// class _CircularFabWidgetState extends State<CircularFabWidget> {
//   @override
//   Widget build(BuildContext context) => Flow(
//     delegate: FlowMenuDelegate(),
//     children: <IconData> [
//       Icons.mail,
//       Icons.call,
//       Icons.notifications,
//       Icons.sms,
//       Icons.menu
//     ].map<Widget>(buildFAB).toList()
//   );

// Widget buildFab(IconData icon) => SizedBox(
//   width: buttonSize,
//   height: buttonSize,
//   child:   FloatingActionButton(
  
//     elevation: 0,
  
//     splashColor: Colors.black,
  
//     child:  Icon(icon, color: Colors.white, size: 45,),
  
//     onPressed: (){},
  
//     ),
// );

// }

// class FlowMenuDelegate extends FlowDelegate{

//   @Override
//   void paintChildren(FlowPaintingContext context){
//     context.paintChild(0);

//   }

//   @override 
//   bool shouldRepaint(FlowMenuDelegate oldDelegate) => false;
// }