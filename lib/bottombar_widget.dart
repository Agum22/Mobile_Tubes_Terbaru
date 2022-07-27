
import 'package:android/AddPage.dart';
import 'package:android/homescreen.dart';
import 'package:flutter/material.dart';

class BottombarWidget extends StatelessWidget{
  @override
  Widget build (BuildContext Context){
    return BottomAppBar(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
        // selectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
     items: [
       BottomNavigationBarItem(
           icon: IconButton(
             onPressed: (){
               Navigator.of(Context).pushAndRemoveUntil(
                   MaterialPageRoute(builder: (context) => HomeScreen()),
                       (Route<dynamic> route) => false);
             },
             icon: Icon(Icons.home, color: Colors.black,),
           ),
           label: 'home'
       ),
       BottomNavigationBarItem(icon: Icon(Icons.search,color: Colors.black,),
           label: 'search'
       ),
       BottomNavigationBarItem(
           icon: IconButton(
             onPressed: (){
               Navigator.of(Context).pushAndRemoveUntil(
                   MaterialPageRoute(builder: (context) => AddPage()),
                       (Route<dynamic> route) => false);
             },
             icon: Icon(Icons.add, color: Colors.black,),
           ),
           label: 'home'
       ),

       BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined,color: Colors.black,),
           label: 'MarketPlace'
       ),
       BottomNavigationBarItem(icon: CircleAvatar(
         backgroundImage: AssetImage('assets/images/avatar.png'),
       ),
           label: 'user'
       ),


     ],

    ));
  }

}