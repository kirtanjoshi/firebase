import 'package:flutter/material.dart';

import 'Widgets/Footer_Widgets.dart';
import 'Widgets/Form_Wigets.dart';

class loginPage extends StatelessWidget {
  const loginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(30),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form_Widget(),
                  Footer_Widgets()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
