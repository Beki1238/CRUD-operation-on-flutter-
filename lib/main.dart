import 'package:flutter/material.dart';
import 'package:student_info/Screens/student_list.dart';
import 'package:student_info/Screens/sw.dart'; 
//import 'package:student_info/Screens/home.dart'; 
import 'package:student_info/Screens/cs.dart'; // Ensure the filename matches
import 'package:student_info/Screens/it.dart'; // Ensure the filename matches
import 'package:student_info/side_menu/floating_action_button.dart';
import 'package:student_info/side_menu/nav_bar.dart'; 

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(title: Text("Home Page")), // Assuming CustomAppBar is defined elsewhere
      body: StudentListScreen(), // Ensure this widget is defined
    );
  }
}

void main() async { 
  runApp( 
    const MaterialApp(debugShowCheckedModeBanner: false, home: BottomNav()), 
  ); 
} 
 
class BottomNav extends StatefulWidget { 
  const BottomNav({super.key}); 

  @override 
  State<BottomNav> createState() => _BottomNavState(); 
} 
 
class _BottomNavState extends State<BottomNav> { 
  int index = 0; 
  final pages = [ 
    const Home(), 
    const Cs(), 
    It(), 
    const Sw() 
  ]; 

  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      body: pages[index], 
      floatingActionButton: Custom_FloatingActionButton(), // Ensure this widget is defined
      bottomNavigationBar: BottomNavigationBar( 
        currentIndex: index, 
        backgroundColor: Colors.blue, 
        selectedItemColor: Colors.black, 
        unselectedItemColor: Colors.grey.shade600, 
        showSelectedLabels: true, 
        showUnselectedLabels: true, 
        selectedFontSize: 15, 
        type: BottomNavigationBarType.fixed, 
        onTap: (value) { 
          print('${pages[value]} bottom navigation pressed'); 
          setState(() { 
            index = value; 
          }); 
        }, 
        items: const [ 
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"), 
          BottomNavigationBarItem(icon: Icon(Icons.computer), label: "CS"), 
          BottomNavigationBarItem(icon: Icon(Icons.desktop_mac), label: "IT"), 
          BottomNavigationBarItem(icon: Icon(Icons.code), label: "SE"), 
        ], 
      ), 
    ); 
  } 
}