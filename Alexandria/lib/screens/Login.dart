
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Home.dart';


class my_controllers{
  static var phno_controller=TextEditingController();
  static var otp_controller=TextEditingController();
  @override
  void dispose(){
    phno_controller.dispose();
    otp_controller.dispose();
  }
}

class Loginscreen extends StatelessWidget{
  @override

  Widget build(BuildContext context){

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image:DecorationImage(image: AssetImage("assets/images/llogo.png"),
                fit:BoxFit.cover
            )
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(child: Text(""),height: 130,),
              Text("Login",style: TextStyle(color: Color.fromARGB(255, 217,188,169),fontSize: 55,fontFamily:'DavidLibre'),),
              SizedBox(child: Text(""),height: 70,),
              SizedBox(
                width: 270,
                child:TextFormField(
                  controller: my_controllers.phno_controller,
                  style: TextStyle(color:Color.fromARGB(255, 217,188,169),fontSize: 20,fontFamily:'DavidLibre'),
                  decoration: const InputDecoration(

                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color:  Color.fromARGB(255, 217,188,169)  ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color:Color.fromARGB(255, 217,188,169)),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 217,188,169)),
                      ),
                       labelText: "Enter Phone Number",
                      labelStyle: TextStyle(
                          color:Color.fromARGB(255, 217,188,169),
                          fontSize: 18,fontFamily:'DavidLibre'
                      )
                  ),

                ),
              ),
              SizedBox(child: Text(""),height: 120,),
              SizedBox(width:160,height:40,child: ElevatedButton(

                onPressed: () async {
                  FirebaseAuth auth = FirebaseAuth.instance;

                  await auth.verifyPhoneNumber(
                    phoneNumber:"+91${my_controllers.phno_controller.text}",
                    verificationCompleted: (PhoneAuthCredential credential) async {
                      //await auth.signInWithCredential(credential);
                          (AuthCredential authCredential){
                        auth.signInWithCredential(credential).then((UserCredential result){
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => Homescreen()
                          ));
                        }).catchError((e){
                          print(e);
                        });
                      };
                    },
                  verificationFailed: (FirebaseAuthException e) {
                  if (e.code == 'invalid-phone-number') {
                   print('The provided phone number is not valid.');
                     }},
                      codeSent: (String verificationId, int? resendToken) async {
                  // Update the UI - wait for the user to enter the SMS code
                  showDialog(context: context, builder: (BuildContext context) {

                  return Container(
                    alignment: Alignment.center,
                      child:AlertDialog(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(new Radius.circular(50.0)),
                        ),
                        title:Center(
                            child:Text('Verify OTP',style:TextStyle(color:Color.fromARGB(255, 217,188,169),fontSize: 25,fontFamily:'DavidLibre'))
                        ),
                    actions: <Widget>[

                      TextField(
                        controller:my_controllers.otp_controller,
                        style: TextStyle(color:Color.fromARGB(255, 217,188,169),fontSize: 20,fontFamily:'DavidLibre'),
                        decoration: const InputDecoration(

                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color:  Color.fromARGB(255, 217,188,169)  ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color:Color.fromARGB(255, 217,188,169)),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color.fromARGB(255, 217,188,169)),
                            ),
                            labelText: "Enter One Time Password",
                            labelStyle: TextStyle(
                                color:Color.fromARGB(255, 217,188,169),
                                fontSize: 18,fontFamily:'DavidLibre'
                            )
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        child:Text("")
                      ),Center(child:SizedBox(
                          height: 50,width: 170,
                      child:ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  side: BorderSide(color: Color.fromARGB(255, 217,188,169))
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 217,188,169)),
                          ),
                        onPressed: () {
                          FirebaseAuth auth = FirebaseAuth.instance;
                          var tsmsCode =my_controllers.otp_controller.text;
                          var tcredential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: tsmsCode);
                          auth.signInWithCredential(tcredential).then((UserCredential result){
                              Navigator.pushReplacement(context, MaterialPageRoute(
                                    builder: (context) => Homescreen()
                                ));
                          }).catchError((e){
                                print(e);
                            });
                          },
                        child:Text("Submit",style: TextStyle(color: Colors.black, fontSize: 26,fontFamily: "DavidLibre")),
                      ))),
                    ],
                  )
                  );
                  }
                  );

                  String smsCode=my_controllers.otp_controller.text;
                  // Create a PhoneAuthCredential with the code
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

                  // Sign the user in (or link) with the credential
                  await auth.signInWithCredential(credential);
                  }, codeAutoRetrievalTimeout: (String verificationId) {
                  // Auto-resolution timed out...
                  }
                  );

                }

                ,child: Text("Login",style: TextStyle(color: Colors.black, fontSize: 23,fontFamily:'DavidLibre'),),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.black)
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 217,188,169)),
                ),)
              ),
            ],
          ),
        ),
      ),
    );
  }
}



