import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:signup_page/otp.dart';
import 'package:signup_page/phone.dart';
import 'package:signup_page/signup_screen.dart';
import 'package:signup_page/login_screen.dart';

import 'hex_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("Something went wrong");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: Text('Welcome'),
          backgroundColor: Color.fromARGB(255, 145, 37, 95)),
      body: Container(
        width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  hexStringToColor("F4ECF7"),
                  hexStringToColor("E8DAEF"),
                  hexStringToColor("D2B4DE")//800080
                ]),
          ),

        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 60, bottom: 1),
                child: Text(
                  'Map Translations',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Image.asset('assets/images/map_logo-removedbg.png', width: 200, height: 200),
              // SizedBox(
              //   height: 5,
              // ),
              // Container(
              //   height: 2,
              // ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 4),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 145, 37, 95)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => loginPage()));
                        },
                        child: Text('Login')),
                  ),
                  Center(
                    child: Container(
                      width: 20,
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 145, 37, 95)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => signup_screen()));
                        },
                        child: Text('Sign-Up')),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Image logoWidget(String imagename){
//   return Image.asset(
//     imagename,
//     fit:BoxFit.fitHeight,
//     width: 100,
//     height:100
// );
// }
// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:signup_page/signup.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Login Page',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const Login(),
//     );
//   }
// }

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Login'),
//         ),
//         body: Center(
//             child: SingleChildScrollView(
//                 child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child:
//               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             // Padding(padding: EdgeInsets.only(
//             // left: 20,
//             // right: 20,)
//             // ),

//             // const SizedBox(
//             //   height: 20,
//             // ),
//             const Center(
//               child: Text(
//                 'Login',
//                 style: TextStyle(
//                     fontSize: 40,
//                     color: Color.fromARGB(154, 6, 50, 162),
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             const Text('Email'),
//             const SizedBox(
//               height: 10,
//             ),
//             TextField(
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                   hintText: 'Enter Email',
//                   prefixIcon: const Icon(Icons.person_outline_outlined)),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             const Text('Password'),
//             const SizedBox(
//               height: 10,
//             ),
//             TextField(
//               obscureText: true,
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                   hintText: 'Enter Password',
//                   prefixIcon: const Icon(Icons.fingerprint),
//                   suffixIcon: const IconButton(
//                       onPressed: null, icon: Icon(Icons.remove_red_eye_sharp))),
//             ),
//             const SizedBox(
//               height: 30,
//             ),

//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: MaterialButton(
//                 minWidth: double.infinity,
//                 onPressed: () {},
//                 child: const Text('Login'),
//                 color: const Color.fromARGB(154, 6, 50, 162),
//                 textColor: Colors.white,
//               ),
//             ),
//             Center(
//               child: Row(
//                 children: [
//                   const Text('Dont have an account?'),
//                   TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const signup()));
//                       },
//                       child: const Text(
//                         'Signup',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ))
//                 ],
//               ),
//             ),
//           ]),
//         ))));
//   }
// }
