import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'DM/Search.dart';
import 'package:android/homescreen.dart';
import 'package:android/Modul6/Dio.dart';

TextEditingController Tf1 = TextEditingController();
TextEditingController Tf2 = TextEditingController();

class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 10,
        title: Text('Instagram',
          style: TextStyle(
            decoration: TextDecoration.none,
            fontFamily: 'Billabong',
            fontSize: 35,
          ),
        ),

        actions: [
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 30,
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return chat();
              }));
            },),
        ],),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0,top: 8.0),
            child: Column(
              children: [
                Image.network('https://picsum.photos/300?random=99'),
                TextField(
                  controller: Tf1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Nama',
                  ),
                ),
                TextField(
                  controller: Tf2,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Caption',
                  ),
                ),
                ElevatedButton(onPressed: () async {
                  await DioClass().add(categoryId: 1, nama: Tf1.text, tampil: Tf2.text, body: Tf2.text, img: 'https://picsum.photos/300?random=99');
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                          (Route<dynamic> route) => false);
                }, child: Text('Post!'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
