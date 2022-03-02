
import 'dart:convert';

import 'package:apitutorials/Models/posts_model.dart';
import 'package:apitutorials/getapi/get_api_screen.dart';
import 'package:apitutorials/postapi/post_api_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomScreen extends StatefulWidget {
  const HomScreen({Key? key}) : super(key: key);

  @override
  _HomScreenState createState() => _HomScreenState();
}

class _HomScreenState extends State<HomScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Api Course'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children:  [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => GetApiTutorials()));
              },
              child: const ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  child: Text('G'),
                ),
                title: Text('Get Apis '),
                subtitle: Text("1. What are Get APIS \n"
                    "2. What are different scenarios to handle Get API \n "
                    "3. Integrate Get APIS  Plugins Model and shows data into List\n "
                    "4. Integrate Get APIS  your own Model and show data into List\n "
                    "5. Integrate Get APIS  without Model and show data into List\n "
                    "6. Very Complex JSON practical Example"),
                trailing: Icon(Icons.arrow_forward),
              ),
            ),
            GestureDetector(
              onTap: (){

                Navigator.push(context, MaterialPageRoute(builder: (context) => PostApiScreen()));

              },
              child: const ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  child: Text('P'),
                ),
                title: Text('Post Apis '),
                subtitle: Text('Integration of post apis with example and with different scenario.'),
                trailing: Icon(Icons.arrow_forward),
              ),
            )
          ],
        ),
      ),
    );
  }
}


