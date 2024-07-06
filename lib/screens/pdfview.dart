import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'Home.dart';

class pdfapi{
  static Future<File> loadFirebase(String url) async{

     final refpdf = FirebaseStorage.instance.ref().child(url);
     final bytes = await refpdf.getData();
     return _storeFile(url, bytes!);

  }
  static Future<File> _storeFile(String url,List<int> bytes) async {
    final filename= basename(url);
    final dir = await getApplicationDocumentsDirectory();
    
    final file=File('${dir.path}/$filename');
    await file.writeAsBytes(bytes,flush: true);
    return file;
  }
}

class pdfview extends StatelessWidget{

  pdfview(this.file,this.bname);
  File file;
  String bname;
  @override
  Widget build(BuildContext context){
    return Scaffold(
        endDrawerEnableOpenDragGesture: false,
        resizeToAvoidBottomInset : false,
        appBar: AppBar(
        toolbarHeight: 80,titleSpacing: 25,
        backgroundColor: Colors.transparent,
        title: Text(bname,style: TextStyle(color: Color.fromARGB(255, 217,188,169),fontSize:24,fontFamily:'DavidLibre')),
    iconTheme: IconThemeData(color: Color.fromARGB(255, 217,188,169),size: 40 ),
    ),
    endDrawer:Drawer(

    backgroundColor: Color.fromARGB(190, 00,00,00),
    width: 400,
    child:bookNav()
    ),

    backgroundColor: Colors.black,

      body: PDFView(
        filePath:file.path,
        swipeHorizontal: true,
      ),
    );
  }
}