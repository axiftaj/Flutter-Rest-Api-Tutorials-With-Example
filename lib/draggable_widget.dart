import 'dart:math';

import 'package:flutter/material.dart';

class DragbaleWidgetScreen extends StatefulWidget {
  const DragbaleWidgetScreen({Key? key}) : super(key: key);

  @override
  _DragbaleWidgetScreenState createState() => _DragbaleWidgetScreenState();
}

class _DragbaleWidgetScreenState extends State<DragbaleWidgetScreen> {

  double left = 0.0 ;
   double    top =0.0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable Widget'),
      ),
      body: Stack(
        children: [
          Positioned(
            left: left,
            top: top,
            child: GestureDetector(
              onPanUpdate: (details){
                left = max(0, left +details.delta.dx);
                top = max(0, top +details.delta.dy);
                setState(() {
                  
                });
              },
              onTap: (){

              },
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(50)
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
