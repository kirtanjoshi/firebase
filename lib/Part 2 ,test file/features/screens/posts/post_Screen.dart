import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../utils/utilities.dart';
import '../../screens/login_Screens/login_Page.dart';

class post_Screen extends StatefulWidget {
  const post_Screen({super.key});

  @override
  State<post_Screen> createState() => _post_ScreenState();
}

class _post_ScreenState extends State<post_Screen> {
  final auth = FirebaseAuth.instance;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Screen"),
        actions: [
          IconButton(onPressed: () {
            auth.signOut().then((value){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>loginPage()));
            }).onError((error, stackTrace)  {
              Utils().Toastmessage(error.toString());
            });
          }, icon: Icon(Icons.logout_outlined))
        ],
      ),
    );
  }
}
