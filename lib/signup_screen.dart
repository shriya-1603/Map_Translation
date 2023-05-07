import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:signup_page/home_screen.dart';
import 'package:email_otp/email_otp.dart';

import 'hex_colors.dart';

class signup_screen extends StatelessWidget {
  var nameval = TextEditingController();
  var emailval = TextEditingController();
  var passval = TextEditingController();
  var mailotp = TextEditingController();
  signup_screen({super.key});

  EmailOTP myauth = EmailOTP();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SIGN UP PAGE'),
        backgroundColor:Color.fromARGB(255, 145, 37, 95)),
      
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
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 300,
              child: TextField(
                controller: nameval,
                decoration: InputDecoration(
                    hintText: 'Enter name',
                    prefixIcon: Icon(Icons.abc),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ),
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
                controller: emailval,
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
                obscureText: true,
                controller: passval,
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
              child: Text(
                'OTP',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 10,
            ),
            Container(
              width: 300,
              child: TextField(
                controller: mailotp,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Enter OTP',
                    suffixIcon: TextButton(
                      child: Text("Send OTP"),
                      onPressed: () async {
                        myauth.setConfig(
                          appEmail: "shriyakotala16@gmail.com",
                          appName: "Email OTP",
                          userEmail: emailval.text,
                          otpLength: 6,
                          otpType: OTPType.digitsOnly,
                        );
                        if (await myauth.sendOTP() == true) {
                          print("OTP sent successfully");
                        } else {
                          print("OTP could not be sent");
                          const snackBar = SnackBar(
                            content: Text('Please enter valid Email Id'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 145, 37, 95)),
                onPressed: () async {
                  if (await myauth.verifyOTP(otp: mailotp.text) == true) {
                    try {
                      UserCredential userCredential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: emailval.text, password: passval.text);
      
                      var db = FirebaseFirestore.instance;
      
                      final person_x = <String, String>{
                        "Name": nameval.text,
                        "Mail": emailval.text,
                        "Password": passval.text,
                      };
      
                      db
                          .collection("people")
                          .doc("man")
                          .set(person_x)
                          .onError((e, _) => print("Error writing document: $e"));
      
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                        const snackBar = SnackBar(
                          content: Text('The password provided is too weak.'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                        const snackBar = SnackBar(
                          content: Text('email-already-in-use'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    } catch (e) {
                      print(e);
                    }
                  } else {
                    const snackBar = SnackBar(
                      content: Text('Incorrect OTP entered'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Text('Sign-Up'))
          ],
        ),
      ),
    );
  }
}