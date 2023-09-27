import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebaseloginseries/Part%202%20,test%20file/utils/utilities.dart';

class Signup_Screen extends StatefulWidget {
  Signup_Screen({super.key});

  @override
  State<Signup_Screen> createState() => _Signup_ScreenState();
}

class _Signup_ScreenState extends State<Signup_Screen> {
  final _formKey = GlobalKey<FormState>();

  final email = TextEditingController();

  final password = TextEditingController();

  bool loading = false;

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    loading;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TextFormField(
                      //   controller: name,
                      //   decoration: const InputDecoration(
                      //       label: Text("FullName"),
                      //       prefixIcon: Icon(Icons.person_outline_rounded)),
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return "Enter name";
                      //     }
                      //     return null;
                      //   },
                      // ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: email,
                        decoration: const InputDecoration(
                            label: Text("Email"),
                            prefixIcon: Icon(Icons.email_outlined)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Email";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      // TextFormField(
                      //   controller: phone,
                      //   decoration: const InputDecoration(
                      //       label: Text("PhoneNo"),
                      //       prefixIcon: Icon(Icons.numbers)),
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return "Enter PhoneNo";
                      //     }
                      //     return null;
                      //   },
                      // ),
                      const SizedBox(height: 20),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: password,
                        decoration: const InputDecoration(
                            label: Text("Password"),
                            prefixIcon: Icon(Icons.fingerprint)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter password";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                loading = true;
                              });
                              _auth
                                  .createUserWithEmailAndPassword(
                                      email: email.text.toString(),
                                      password: password.text.toString())
                                  .then((value) {
                                    Navigator.pop(context);
                                setState(() {
                                  loading = true;
                                });
                              }).onError((error, stackTrace) {
                                Utils().Toastmessage(error.toString());
                                setState(() {
                                  loading = false;
                                });
                              });
                            }
                          },
                          child: Center(
                              child: loading
                                  ? CircularProgressIndicator(
                                      strokeWidth: 3,
                                      color: Colors.white,
                                    )
                                  : Text("Signup".toUpperCase())),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text.rich(
                          TextSpan(
                              text: "Already Have a Account ?",
                              style: Theme.of(context).textTheme.bodyText1,
                              children: const [
                                TextSpan(
                                    text: "Login",
                                    style: TextStyle(color: Colors.blue))
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
