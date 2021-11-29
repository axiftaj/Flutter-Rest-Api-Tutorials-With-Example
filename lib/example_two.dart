import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ExampleTwo extends StatefulWidget {
  const ExampleTwo({Key? key}) : super(key: key);

  @override
  _ExampleTwoState createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {

  List<Photos> photosList = [];
  
  Future<List<Photos>> getPhotos ()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos')) ;
    var data = jsonDecode(response.body.toString());

    print(data);
    if(response.statusCode == 200){
      for(Map i in data){
        Photos photos = Photos(title: i['title'], url: i['url'] , id: i['id']);
        photosList.add(photos);
      }
      return photosList ;
    }else {
      return photosList ;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Api Course'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPhotos(),
                builder: (context,AsyncSnapshot<List<Photos>> snapshot){
              return ListView.builder(
                  itemCount: photosList.length ,
                  itemBuilder: (context , index){
                return ListTile(
                  leading:CircleAvatar(
                    backgroundImage:  NetworkImage(snapshot.data![index].url.toString()),
                  ),
                  subtitle: Text(snapshot.data![index].title.toString()),
                  title: Text('Notes id:'+snapshot.data![index].id.toString()),
                );
              });
            }),
          ),
      ],
    ),
    );
  }
}

class Photos {
  String title , url ;
  int id ;
  Photos({required this.title ,required this.url , required this.id}) ;
}
