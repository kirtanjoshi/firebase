import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutterfirebaseloginseries/Part%202%20,test%20file/utils/utilities.dart';

import '../../../authentications/login_with_Phonenumber.dart';
import '../../posts/post_Screen.dart';

class Form_Widget extends StatefulWidget {
  @override
  State<Form_Widget> createState() => _Form_WidgetState();
}

class _Form_WidgetState extends State<Form_Widget> {

  bool  loading = false;
  final email = TextEditingController();
  final password = TextEditingController();
  final _formField = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
  }
  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
        email: email.text, password: password.text.toString())
        .then((value) {
      Utils().Toastmessage(value.user!.email.toString());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => post_Screen())
      );
      setState(() {
        loading = false;
      });
    })

        .onError((error, stackTrace) async {
     debugPrint(error.toString());
      Utils().Toastmessage(error.toString());
    setState(() {
    loading = false;
    });
      // Return a Future that completes with null.
      // return Future.value(null);
    });
  }





  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formField,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: email,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outline_outlined),
                    labelText: "Email",
                    hintText: "Email",
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "enter Email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                controller: password,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.fingerprint),
                  labelText: "Password",
                  hintText: " Password",
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.remove_red_eye_sharp),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "enter Pass";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formField.currentState!.validate()) {
                      login();
                    }
                  },
                  child: Text("Login".toUpperCase()),
                ),
              ),

              SizedBox(
                height:30,
              ),

              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>login_with_Phonenumber()));
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.black
                    )
                  ),
                  child: Center(

                    child: Text("Login with phone"),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
