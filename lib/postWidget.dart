
import 'package:android/DM/List.dart';
import 'package:android/Modul6/Dio.dart';
import 'package:android/Modul6/Model.dart';
import 'package:android/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({Key? key}) : super(key: key);

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Welcome>(
      future: DioClass().getData(),
      builder: (context, snapshot) {
        List<Post> uList = snapshot.data!.posts;
        return ListView.builder(
          itemCount: uList.length,
          itemBuilder:(context,index){
            return Column(
              children: [
                ListTile(
                  // onTap: (){
                  //   DioClass().delete(uList[index].id.toString());
                  // },
                  leading: Container(
                    width: 50,
                    height:50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(),

                        image: DecorationImage(
                          image: NetworkImage(uList[index].img),
                        )
                    ),

                  ),
                  title: Text(uList[index].nama),
                ),

                Container(
                    height: 300,
                    decoration: BoxDecoration(

                      image:DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(uList[index].img),
                      ),


                    )
                ),
                ListTile(
                  leading: Wrap(
                    spacing: 10,
                    children: [
                      IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.favorite,color: Colors.red,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.comment_outlined,color: Colors.black,
                          size: 28,
                        ),
                      ),
                      IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.share,color: Colors.black,
                          size: 28,
                        ),
                      ),
                      IconButton(
                        onPressed: (){
                          setState((){
                            DioClass().delete(uList[index].id.toString());
                          });
                        },
                        icon: Icon(Icons.delete, color: Colors.black,
                          size: 28,),
                      )

                    ],
                  ),
                ),
                Column(
                    children:[
                      Padding(
                        padding: const EdgeInsets.only(left:18.0),
                        child: Text(uList[index].tampil,
                            style:TextStyle(
                              fontWeight: FontWeight.w700,
                            )),
                      ),
                    ]
                ),
                Row(
                    children:[
                      Padding(
                        padding: const EdgeInsets.only(left:18.0),
                        child: Text('Harta Tahta Nilai A',
                            style:TextStyle(
                              fontWeight: FontWeight.w700,

                            )),
                      ),

                    ]),

                Row(
                    children:[
                      Padding(
                        padding: const EdgeInsets.only(left:18.0),
                        child: Text('Lihat semua 1.232 komentar',
                            style:TextStyle(
                            )),
                      ),
                    ]),

              ],

            );
          },

        );
      },
    );
  }
}
