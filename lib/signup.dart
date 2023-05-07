import 'package:flutter/material.dart';

import 'hex_colors.dart';
class signup extends StatelessWidget {
  const signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Signup'),
        ),
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
              
            child:
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            // Padding(padding: EdgeInsets.only(
                            // left: 20,
                            // right: 20,)
                            // ),
                
                            SizedBox(
                  height: 25,
                            ),
                            Center(
                  child: Text(
                    'Signup',
                    style: TextStyle(
                        fontSize: 40,
                        color: Color.fromARGB(154, 6, 50, 162),
                        fontWeight: FontWeight.bold),
                  ),
                            ),
                            SizedBox(
                  height: 30,
                            ),
                  //           Text('Email'),
                  //           SizedBox(
                  // height: 10,
                  //           ),
                            TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Enter Email',
                      prefixIcon: Icon(Icons.person_outline_outlined)),
                            ),
                            SizedBox(
                  height: 30,
                            ),
                  //           Text('Password'),
                  //           SizedBox(
                  // height: 10,
                  //           ),
                            TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Enter Password',
                      prefixIcon: Icon(Icons.fingerprint),
                      suffixIcon: IconButton(
                        onPressed: null,
                        icon:Icon(Icons.remove_red_eye_sharp)
                        ),
                      ),
                    
                      
                            ),
                            SizedBox(
                  height: 30,
                            ),
                  //           Text('Confirm Password'),
                  //           SizedBox(
                  // height: 10,
                  //           ),
                            TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Confirm Password',
                      prefixIcon: Icon(Icons.password),
                      
                      ),
                            ),
                            SizedBox(
                  height: 30,
                            ),
                            
                            Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    onPressed: () {},
                    child: Text('Signup'),
                    color: Color.fromARGB(154, 6, 50, 162),
                    textColor: Colors.white,
                  ),
                            )
                          ]),
                ),
          ),
        ));
  }
}