import 'dart:async';
import 'package:alexandria/screens/Home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:alexandria/screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Studyapp()
   ));
}



class Studyapp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    Timer(const Duration(seconds: 3),()=>Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) =>Login()
        )));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
    body: Container(
      decoration: BoxDecoration(
        image:DecorationImage(image: AssetImage("assets/images/splashscreen.png"),
          fit:BoxFit.cover
        )
      ),
    ),
    );
  }
}


class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image:DecorationImage(image: AssetImage("assets/images/splashscreen.png"),
                fit:BoxFit.cover
            )
        ),
        child: Column(
          children: [
            SizedBox(height: 560,width: 1000,child: Text(""),)
           , SizedBox(height: 50,width: 170,
            child:ElevatedButton(style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: BorderSide(color: Colors.black)
                ),
              ),
              backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 217,188,169)),
            ),onPressed: (){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) =>Homescreen()
                  ));
            }, child: Text("Login",style: TextStyle(color: Colors.black, fontSize: 25,fontFamily: "DavidLibre"),),)),
            SizedBox(height: 30,width: 1000,child: Text(""),),
            Text("New User? Login",style: TextStyle(color: Color.fromARGB(255, 217,188,169), fontSize: 14),)
          ],
        ),
      ),
    );
  }
}
