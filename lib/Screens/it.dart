import 'package:flutter/material.dart';
import 'package:student_info/Screens/button_style.dart';
import 'package:student_info/Screens/custom_app_bar.dart';
import 'package:student_info/Screens/sw.dart';

class It extends StatelessWidget {
  // const It ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context,"information technology screen"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Sw()),
                );
              },
              style: customButtonStyle(),
              child: const Text("go to briliant software engineering students i don't know"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: customButtonStyle(),
              child: const Text("back to computer science"),
            )
          ],
        ),
      ),
    );
  }
}
