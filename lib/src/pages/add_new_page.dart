import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNewPage extends StatefulWidget{
  AddNewPageState createState() => AddNewPageState();
}

class AddNewPageState extends State<AddNewPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add new'),),
      body: Center(
        child: Icon(Icons.add_alarm, size: 50,),
      ),
    );
  }
}