
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../signup _ Page/signup_Page.dart';

class Footer_Widgets extends StatelessWidget {
  const Footer_Widgets({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(height:  20),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: (){},
            child: Text(" login in with Google"),
          )
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup_Screen()));
          },
          child: Text.rich(
            TextSpan(
                text: "Don;t have the account ?",
                style: Theme.of(context).textTheme.bodyText1,
                children: const [
                  TextSpan(text:"Sign up", style: TextStyle(color: Colors.blue))
                ]),
          ),
        ),
      ],
    );
  }
}
