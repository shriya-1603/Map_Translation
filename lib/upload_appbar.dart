import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:signup_page/custom_icons.dart';

import 'hex_colors.dart';
import 'main.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Upload Image"),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            // actions: [
            //   IconButton(
            //     icon: Icon(Icons.notifications_none),
            //     onPressed: () {},
            //   ),
            //   IconButton(
            //     icon: Icon(Icons.search),
            //     onPressed: () {},
            //   )
            // ],
            //backgroundColor: Colors.purple,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [hexStringToColor("46302B"), hexStringToColor("76504E")],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
            ),
            bottom: TabBar(
              //isScrollable: true,
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              tabs: [
                Tab(icon: Icon(CustomIcons.sat_svg,size: 40), text: 'Satellite'),
                Tab(icon: Icon(CustomIcons.map_svg,size:40), text: 'Map'),
              ],
            ),
            elevation: 20,
            titleSpacing: 20,
          ),
          body: Container(
            width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  hexStringToColor("D3CCCA"),
                  hexStringToColor("A37E7E"),
                  //hexStringToColor("86736C")//800080
                ]),
          ),
            child: TabBarView(
              children: [
                buildPage('Satellite Page'),
                buildPage('Map Page'),
              ],
            ),
          ),
        ),
      );

  Widget buildPage(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 28),
        ),
      );
}
  
