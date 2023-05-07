import 'package:flutter/material.dart';
import 'package:signup_page/upload_appbar.dart';
import 'hex_colors.dart';
import 'prev_posts.dart';
import 'upload.dart';
// import 'package:price_pred/screens/user_screen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int val = 0;
  var navbar = [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          color: Colors.white,
        ),
        label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.menu, color: Colors.white), label: 'Previous Posts'),
    // const BottomNavigationBarItem(
    //     icon: Icon(Icons.person, color: Colors.white), label: 'User'),
  ];
  var navbody = [
    const Upload(),
    const Displayposts(),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // int val = 0;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const SignInScreen(),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: navbody[val],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: val,
          type: BottomNavigationBarType.fixed, 
          // Fixed
          backgroundColor:Color.fromARGB(255, 145, 37, 95),
          selectedItemColor: Colors.white,
          unselectedItemColor: Color.fromARGB(255, 255, 255, 255),
          selectedFontSize: 15,
          unselectedFontSize: 13,
          // fixedColor: Colors.black,
          items: navbar,
          onTap: (value) {
            setState(() {
              val = value;
            });
          },
        ),
      ),
    );
  }
}