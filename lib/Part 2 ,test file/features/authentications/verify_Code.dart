import 'package:flutter/material.dart';

class VerifyCodeScreen extends StatelessWidget {

  final verificationId;
 VerifyCodeScreen({super.key, required this.verificationId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("verifyCode"),
      ),

      body: Column(
        children: [

        ],
      ),
    );
  }
}
