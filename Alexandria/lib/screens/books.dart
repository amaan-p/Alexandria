import 'dart:io';
import 'package:alexandria/screens/Home.dart';
import 'package:alexandria/screens/pdfview.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class Bookscreen extends StatelessWidget {
Bookscreen(this.name,this.auth,this.desc);
String name;
String auth;
String desc;
  @override
  Widget build(BuildContext context) {
    List<String> bname= name.split(".");
    return Scaffold(
      endDrawerEnableOpenDragGesture: false,
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        toolbarHeight: 80,titleSpacing: 25,
        backgroundColor: Colors.transparent,
        title: Text(bname[0],style: TextStyle(color: Color.fromARGB(255, 217,188,169),fontSize:24,fontFamily:'DavidLibre')),
        iconTheme: IconThemeData(color: Color.fromARGB(255, 217,188,169),size: 40 ),
      ),
      endDrawer:Drawer(

        backgroundColor: Color.fromARGB(190, 00,00,00),
        width: 400,
        child:bookNav()
      ),

      backgroundColor: Colors.black,
    body: Container(
      decoration: BoxDecoration(
          image:DecorationImage(image: AssetImage("assets/images/Homeback.png"),
              fit:BoxFit.cover
          )
      ),
    child:Center(
      child:Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 300,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                image:DecorationImage(image: AssetImage( 'assets/images/book/$name'),
                    fit:BoxFit.cover
                )
            ),
          ),
          SizedBox(height: 40,),
          Container(
            padding: EdgeInsets.all(30),
            height: 360,
            width: 350,
            decoration: BoxDecoration(
              color:  Color.fromARGB(190,33, 27, 21),
                borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
            child: Column(
              children: [
                SizedBox(height: 0,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 28,),
                      Text(bname[0],style: TextStyle(color: Color.fromARGB(255, 217,188,169),fontSize:21,fontFamily:'DavidLibre')),
                 SizedBox(width: 11,)
                 , Icon(
                      Icons.favorite_border_outlined,
                      color: Color.fromARGB(255, 217,188,169),
                      size: 28.0,
                    )
                  ],
                ),
                SizedBox(height: 5,),
                Container(
                  child: Text("By "+auth,style: TextStyle(color: Color.fromARGB(255, 217,188,169),fontSize:15,fontFamily:'DavidLibre')),
                ),
                SizedBox(height: 20,),
            Column(
              children: [
                Text(desc,textAlign: TextAlign.center,style: TextStyle(color: Color.fromARGB(200, 217,188,169),fontSize:21,fontFamily:'DavidLibre')),
              ],
            ),
                SizedBox(height: 20,),
                SizedBox(
                  height:40,
                  width: 150,
                    child:ElevatedButton(style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.black)
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 217,188,169)),
                ),
                      onPressed: () async{
                      final file =await pdfapi.loadFirebase(bname[0]+".pdf");
                      if (file==null) return;
                      openPDF(context,file,bname[0]);
                }, child: const Text("Read",style: TextStyle(color: Colors.black, fontSize: 25,fontFamily: "DavidLibre"),),)
                )],
            ),
            ),
        ],
      ),
      ),
    )
    );
  }
}

void openPDF(BuildContext context,File file,String bname)=> Navigator.push(context,
    MaterialPageRoute(builder: (context)=>pdfview(file,bname))

);