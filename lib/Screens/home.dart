import 'package:flutter/material.dart';
import 'package:student_info/Screens/button_style.dart';
import 'package:student_info/screens/cs.dart';
import 'package:student_info/screens/custom_app_bar.dart';
import 'package:student_info/side_menu/nav_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  NavBar(),
      appBar: CustomAppBar(context,"Home Page"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Cs()),
                );
              },
              style: customButtonStyle(),
              child:
                  const Text("go to computer science there is a big question"),
            ),
          ],
        ),
      ),
    );
  }
}
