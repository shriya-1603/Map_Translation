import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:signup_page/phone.dart';
import 'package:signup_page/signup_screen.dart';

import 'package:signup_page/home_screen.dart';

import 'hex_colors.dart';

class loginPage extends StatelessWidget {
  // var nameval = TextEditingController();
  String emailval = '';
  String passval = '';
  loginPage({super.key});
  TextEditingController country_code = TextEditingController();
  var phone = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN PAGE'),
        backgroundColor: Color.fromARGB(255, 145, 37, 95),
      ),
      body:  Container(
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
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'E-Mail',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: 300,
                  child: TextField(
                    // controller: emailval,
                    onChanged: (value) {
                      emailval = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'Enter email id',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Password',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: 300,
                  child: TextField(
                    // controller: passval,
                    onChanged: (value) {
                      passval = value;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Enter password',
                        prefixIcon: Icon(Icons.password),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                ),
                Container(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      // Center(
                      // child:
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10,
                            left: MediaQuery.of(context).size.width / 4,
                            right: 10),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:Color.fromARGB(255, 145, 37, 95)),
                            onPressed: () async {
                              // print("Login button pressed");
                              try {
                                UserCredential userCredential = await FirebaseAuth
                                    .instance
                                    .signInWithEmailAndPassword(
                                        email: emailval, password: passval);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()));
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  print('No user found for that email.');
                                  const snackBar = SnackBar(
                                    content: Text('No user found'),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                } else if (e.code == 'wrong-password') {
                                  print('Wrong password provided for that user.');
                                  const snackBar = SnackBar(
                                    content: Text('Wrong password'),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              }
                            },
                            child: Text('Login')),
                      ),
                      // SizedBox(
                      //   width: 50,
                      // ),
                      // ),
                      // Container(
                      //   width: 10,
                      // ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
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
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    child: Column(
                  children: [
                    Text('OR'),
                    SizedBox(
                      height: 20,
                    ),
                    // Text(
                    //   'Login with Mobile Number',
                    //   style: TextStyle(fontWeight: FontWeight.bold),
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:Color.fromARGB(255, 145, 37, 95)),
                        onPressed: () async {
                          // await FirebaseAuth.instance.verifyPhoneNumber(
                          //   phoneNumber: '${country_code.text + phone}',
                          //   verificationCompleted:
                          //       (PhoneAuthCredential credential) {},
                          //   verificationFailed: (FirebaseAuthException e) {},
                          //   codeSent: (String verificationId, int? resendToken) {
                          //     Navigator.pushNamed(context, "otp");
                          //   },
                          //   codeAutoRetrievalTimeout: (String verificationId) {},
                          // );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => phone_otp()));
                        },
                        child: Text('Login with OTP'))
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //         title: Text('LOGIN PAGE'),
  //         backgroundColor: Color.fromARGB(255, 145, 37, 95)),
  //     body: Center(
  //       child: Column(
  //         // mainAxisAlignment: MainAxisAlignment.start,
  //         // crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Container(
  //             padding: EdgeInsets.all(10),
  //             child: Text(
  //               'E-Mail',
  //               style: TextStyle(fontWeight: FontWeight.bold),
  //             ),
  //           ),
  //           Container(
  //             width: 300,
  //             child: TextField(
  //               // controller: emailval,
  //               onChanged: (value) {
  //                 emailval = value;
  //               },
  //               keyboardType: TextInputType.emailAddress,
  //               decoration: InputDecoration(
  //                   hintText: 'Enter email id',
  //                   prefixIcon: Icon(Icons.email),
  //                   border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(20),
  //                   )),
  //             ),
  //           ),
  //           Container(
  //             padding: EdgeInsets.all(10),
  //             child: Text(
  //               'Password',
  //               style: TextStyle(fontWeight: FontWeight.bold),
  //             ),
  //           ),
  //           Container(
  //             width: 300,
  //             child: TextField(
  //               // controller: passval,
  //               onChanged: (value) {
  //                 passval = value;
  //               },
  //               obscureText: true,
  //               decoration: InputDecoration(
  //                   hintText: 'Enter password',
  //                   prefixIcon: Icon(Icons.password),
  //                   border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(20),
  //                   )),
  //             ),
  //           ),
  //           Container(
  //             height: 10,
  //           ),
  //           Container(
  //             padding: EdgeInsets.all(10),
  //             child: Row(
  //               children: [
  //                 // Center(
  //                 // child:
  //                 Padding(
  //                   padding: EdgeInsets.only(
  //                       top: 10,
  //                       left: MediaQuery.of(context).size.width / 3.1,
  //                       right: 10),
  //                   child: ElevatedButton(
  //                       style: ElevatedButton.styleFrom(
  //                           backgroundColor: Color.fromARGB(255, 145, 37, 95)),
  //                       onPressed: () async {
  //                         // print("Login button pressed");
  //                         try {
  //                           UserCredential userCredential = await FirebaseAuth
  //                               .instance
  //                               .signInWithEmailAndPassword(
  //                                   email: emailval, password: passval);
  //                           Navigator.push(
  //                               context,
  //                               MaterialPageRoute(
  //                                   builder: (context) => Home()));
  //                         } on FirebaseAuthException catch (e) {
  //                           if (e.code == 'user-not-found') {
  //                             print('No user found for that email.');
  //                             const snackBar = SnackBar(
  //                               content: Text('No user found'),
  //                             );
  //                             ScaffoldMessenger.of(context)
  //                                 .showSnackBar(snackBar);
  //                           } else if (e.code == 'wrong-password') {
  //                             print('Wrong password provided for that user.');
  //                             const snackBar = SnackBar(
  //                               content: Text('Wrong password'),
  //                             );
  //                             ScaffoldMessenger.of(context)
  //                                 .showSnackBar(snackBar);
  //                           }
  //                         }
  //                       },
  //                       child: Text('Login')),
  //                 ),
  //                 // ),
  //                 // Container(
  //                 //   width: 10,
  //                 // ),
  //                 Padding(
  //                   padding: EdgeInsets.only(top: 10),
  //                   child: ElevatedButton(
  //                       style: ElevatedButton.styleFrom(
  //                           backgroundColor: Color.fromARGB(255, 145, 37, 95)),
  //                       onPressed: () {
  //                         Navigator.push(
  //                             context,
  //                             MaterialPageRoute(
  //                                 builder: (context) => signup_screen()));
  //                       },
  //                       child: Text('Sign-Up')),
  //                 ),
  //                 SizedBox(
  //             height: 20,
  //           ),
  //           Container(
  //               child: Column(
  //             children: [
  //               Text('OR'),
  //               SizedBox(
  //                 height: 20,
  //               ),
  //               Text(
  //                 'Login with Mobile Number',
  //                 style: TextStyle(fontWeight: FontWeight.bold),
  //               ),
  //               SizedBox(
  //                 height: 20,
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: TextField(
  //                   keyboardType: TextInputType.phone,
  //                   onChanged: (value) {
  //                     phone = value;
  //                   },
  //                   decoration: InputDecoration(
  //                       hintText: ' Phone number',
  //                       prefixIcon: Icon(Icons.phone),
  //                       border: OutlineInputBorder(
  //                         borderRadius: BorderRadius.circular(20),
  //                       )),
  //                 ),
  //               ),
  //               ElevatedButton(
  //                   onPressed: () async {
  //                     // await FirebaseAuth.instance.verifyPhoneNumber(
  //                     //   phoneNumber: '${country_code.text + phone}',
  //                     //   verificationCompleted:
  //                     //       (PhoneAuthCredential credential) {},
  //                     //   verificationFailed: (FirebaseAuthException e) {},
  //                     //   codeSent: (String verificationId, int? resendToken) {
  //                     //     Navigator.pushNamed(context, "otp");
  //                     //   },
  //                     //   codeAutoRetrievalTimeout: (String verificationId) {},
  //                     // );
  //                     Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                             builder: (context) => phone_otp()));
  //                   },
  //                   child: Text('Send OTP'))
  //             ],
  //           )),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
