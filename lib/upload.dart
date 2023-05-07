import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signup_page/show_img1.dart';
import 'package:signup_page/show_img2.dart';
import 'hex_colors.dart';
import 'show_img.dart';
import 'package:uuid/uuid.dart';

import 'auth_methods.dart';
import 'input.dart';
import 'package:http/http.dart' as http;

import 'get_predictions.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // @override
    // void dispose(

    // )
    void Store(String file1, String file2) {
      String postid = const Uuid().v1();
      String? uid = FirebaseAuth.instance.currentUser?.uid;

      FirebaseFirestore.instance
          .collection('images')
          .doc(uid)
          .collection('input')
          .doc(postid)
          .set({'input': file1, 'output': file2});
      // print('stored');
    }

    ;
    Future<GetPrediction> askPrediction(Uint8List img, int c) async {
      setState(() {
        loading = true;
      });
      print(img);
      String base64String = base64Encode(img);
      print("here  $base64String");
      final response = await http.post(
        Uri.parse(
            'https://7a0a-183-82-111-80.in.ngrok.io/generate'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'type': c,
          'image': base64String,
        }),
      );

      if (response.statusCode == 200) {
        print("hello res");
        return GetPrediction.fromJson(jsonDecode(response.body));
      } else {
        // print('Request failed with status: ${response.body}.');
        throw Exception('Failed to fetch');
      }
    }

    if (loading) {
      return Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        //  title: const Text('Satellite to map'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Stack(
          children: [
            // Positioned(
            //     height: size.height * 0.4,
            //     width: size.width,
            //     child: Container(
            //       height: 400,
            //     )),
            // Positioned(
            //   top: size.height * 0.35,
            //   height: size.height * 0.65,
            //   width: size.width,
              Container(
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
                // height: double.infinity,
                // width: double.infinity,
                // decoration: const BoxDecoration(
                //     color: Color.fromARGB(255, 255, 255, 255),
                //     borderRadius: BorderRadius.only(
                //       topLeft: Radius.circular(36.0),
                //       topRight: Radius.circular(36.0),
                //     )),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height:150,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FutureBuilder(
                          future: Authmethods().getUsername(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator
                                  .adaptive();
                            }
                            if (snapshot.hasError) {}
                            return Text(
                              'Upload Image ${snapshot.data}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            );
                          },
                        ),
                
                        // const SizedBox(
                        //   height: 10,
                        // ),
                          //           SizedBox(
                          //   height: 20,
                          // ),
                          Center(child: Image.asset('assets/images/upload_logo-removedbg.png', width: 150, height: 150)),
                          // SizedBox(
                          //   height: 20,
                          // ),
                      ],
                      
                    ),
                    // const SizedBox(
                    //   height: 80,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor:Color.fromARGB(255, 145, 37, 95),
                              radius: 40,
                              child: IconButton(
                                  onPressed: () async {
                                    //     // Navigator.of(context).pop();
                                    // Navigator.push(context,
                                    //   MaterialPageRoute(builder: (context) => Edit()));
                                    Uint8List? file, file1;
                                    // print("file $file");
                                    try {
                                      file = await pickImage(ImageSource.gallery);
                                      // print("file $file");
                                      try {
                                        final GetPrediction s =
                                            await askPrediction(
                                                file as Uint8List, 0);
                                        // file1 = s.result;
                                        setState(() {
                                          loading = false;
                                        });
                                        file1 = base64Decode(s.result);
                
                                        // print(s.result);
                                      } catch (e) {
                                        // print("erorr pred");
                                      }
                                      // print(file1);
                                    } catch (e) {
                                      // print(e.toString());
                                    }
                                    Store(base64Encode(file as Uint8List),
                                        base64Encode(file1 as Uint8List));
                                    // ignore: use_build_context_synchronously
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Post1(
                                                  img1: file as Uint8List,
                                                  img2: file1 as Uint8List,
                                                )));
                                  },
                                  icon: const Icon(
                                    Icons.photo,
                                  )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Satellite',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor:Color.fromARGB(255, 145, 37, 95),
                              radius: 40,
                              child: IconButton(
                                  onPressed: () async {
                                    //     // Navigator.of(context).pop();
                                    // Navigator.push(context,
                                    //   MaterialPageRoute(builder: (context) => Edit()));
                                    Uint8List? file, file1;
                                    // print("file $file");
                                    try {
                                      file = await pickImage(ImageSource.gallery);
                                      print("file $file");
                                      try {
                                        print("file $file");
                                        final GetPrediction s =
                                            await askPrediction(
                                                file as Uint8List, 1);
                                        setState(() {
                                          loading = false;
                                        });
                                        // file1 = s.result;
                                        file1 = base64Decode(s.result);
                                        // print(s.result);
                                      } catch (e) {
                                        // print("erorr pred");
                                      }
                                      // print(file1);
                                    } catch (e) {
                                      // print(e.toString());
                                    }
                                    Store(base64Encode(file as Uint8List),
                                        base64Encode(file1 as Uint8List));
                                    // ignore: use_build_context_synchronously
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Post2(
                                                  img1: file as Uint8List,
                                                  img2: file1 as Uint8List,
                                                )));
                                  },
                                  icon: const Icon(
                                    Icons.photo,
                                  )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Map',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}