import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('I Am Rich'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Center(
        child: Image(
          image: NetworkImage(
              'https://img2.baidu.com/it/u=3359649605,3626874592&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=752'),
        ),
      ),
    ),
  ));
}
