import 'package:flutter/material.dart';
import 'package:calculator_app/widgets/Body.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CALCULATOR", style: TextStyle(color: Colors.grey[100], fontWeight: FontWeight.bold),),
        backgroundColor: Colors.black87,
        elevation: 0,
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}