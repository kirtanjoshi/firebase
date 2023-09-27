import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../login_Screens/login_Page.dart';
import '../posts/post_Screen.dart';




class splash_Screen  extends StatefulWidget{
  @override
  State<splash_Screen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splash_Screen> {


   void isLogin(BuildContext context){
     final auth = FirebaseAuth.instance;

     final user = auth.currentUser;
     if(user!=null){
       Timer(Duration(seconds: 2), () {
         Navigator.push(context,
             MaterialPageRoute(builder:(context) => post_Screen(),)
         );
       });
     }else{
       Timer(Duration(seconds: 2), () {
         Navigator.push(context,
             MaterialPageRoute(builder:(context) => loginPage(),),
         );
       });
     }
   }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: Colors.blue,
        child: Center(child: Text("Welcome",style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),)),
      ),
    );
  }
}