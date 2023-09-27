import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebaseloginseries/Part%202%20,test%20file/features/authentications/verify_Code.dart';
import 'package:flutterfirebaseloginseries/Part%202%20,test%20file/utils/utilities.dart';

class login_with_Phonenumber extends StatefulWidget {
  const login_with_Phonenumber({super.key});

  @override
  State<login_with_Phonenumber> createState() => _login_with_PhonenumberState();
}

class _login_with_PhonenumberState extends State<login_with_Phonenumber> {

  final phonenumberController = TextEditingController();
  bool loading = false;
final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logi in with Phonenumber"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: TextFormField(
                controller: phonenumberController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),

            SizedBox(height: 30,),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: (){
                  auth.verifyPhoneNumber(
                    phoneNumber: phonenumberController.text,
                      verificationCompleted: (_){},
                      verificationFailed: (e){
                      Utils().Toastmessage(e.toString());
                      },
                      codeSent: (String verificationId , int? token){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyCodeScreen(verificationId: verificationId,)));
                      },
                      codeAutoRetrievalTimeout: (e){
                        Utils().Toastmessage(e.toString());
                      }
                  );
                  },
                  child: Text("Login"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
