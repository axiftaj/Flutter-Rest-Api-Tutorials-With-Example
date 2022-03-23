import 'package:apitutorials/getapi/get_api_screen.dart';
import 'package:apitutorials/signup.dart';
import 'package:apitutorials/upload_image.dart';
import 'package:flutter/material.dart';


class PostApiScreen extends StatefulWidget {
  const PostApiScreen({Key? key}) : super(key: key);

  @override
  _PostApiScreenState createState() => _PostApiScreenState();
}

class _PostApiScreenState extends State<PostApiScreen> {

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
            ReusableWidget(title: 'Login & SignUp',
              subTitle: 'Login and sign up api integration using open source api',onPress: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
            },),
            ReusableWidget(title: 'Upload image to server', subTitle:
            'Upload image to server using image path(url)',onPress: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => UploadImageScreen()));
            },),


          ],
        ),
      ),
    );
  }
}
