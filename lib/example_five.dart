import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http ;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:path/path.dart';

class ExampleFiverScreen extends StatefulWidget {
  const ExampleFiverScreen({Key? key}) : super(key: key);

  @override
  _ExampleFiverScreenState createState() => _ExampleFiverScreenState();
}

class _ExampleFiverScreenState extends State<ExampleFiverScreen> {

  File? _image;
  final picker = ImagePicker();
  bool showSpinner = false;

  Future getImage() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.gallery, imageQuality: 80);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        updateProfileImage(context);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> updateProfileImage(context) async {
    setState(() {
      showSpinner = true;
    });
    var result;


    var stream = new http.ByteStream(_image!.openRead());
    stream.cast();
    var length = await _image!.length();

    var uri = Uri.parse('https://fakestoreapi.com/products');


    var request = new http.MultipartRequest("POST", uri);

    request.fields["title"] = "Hello";
    request.fields["price"] = "200";

    var multipartFile = new http.MultipartFile(
        "image", stream, length, filename: basename(_image!.path));


    request.files.add(multipartFile);
    var response = await request.send();

    var respStr = await response.stream.bytesToString();
    var responseJson = json.decode(respStr);

    Map<String, dynamic> map = responseJson;

    if (response.statusCode == 200) {
      setState(() {
        showSpinner = false;
      });
      print(map['_id']);
      print('image uploaded successfully');

    } else {
      setState(() {
        showSpinner = false;
      });
    }


    return result;
  }

  @override
  Widget build(BuildContext context) {
    print(_image);
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  getImage() ;
                },
                child: _image == null ?
                Container(
                  height: 100,
                  child: Center(
                      child: Text('Upload')
                  ),
                ): Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Center(
                      child: Image.file(
                        File(_image!.path).absolute,
                        width: 100,
                        fit: BoxFit.cover,
                        height: 100,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
