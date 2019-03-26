/*
Name: Akshath Jain
Date: 3/26/19
Purpose: gets the status of the door
*/

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(Foxtrot());

class Foxtrot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.red
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  Map _doorStatus;

  @override
  void initState() {
    super.initState();

    _fetchData();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Foxtrot"),
      ),
      body: _body(),
    );
  }

  Widget _body(){
    if(_doorStatus == null)
      return Center(child: CircularProgressIndicator(),);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[

        Center(
          child: Container(
            width: 175,
            height: 175,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _getColor(),
                width: 6.0
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  _getIcon(),
                  color: _getColor(),
                  size: 75.0,
                ),
              ],
            ),
          ),
        ),
        

        SizedBox(height: 24.0,),

        Text(
          _getString(),
          style: TextStyle(
            fontSize: 18.0
          ),
        ),

        SizedBox(height: 48.0,),

        RaisedButton(
          child: Text("Check Status"),
          onPressed: _fetchData,
          color: Colors.black,
          textColor: Colors.white,
        ),
      ],
    );
  }

  Color _getColor(){
    return _doorStatus["doorOpen"] == false ? Colors.green : Colors.red;
  }

  IconData _getIcon(){
    return _doorStatus["doorOpen"] == false ? Icons.check : Icons.clear;
  }

  String _getString(){
    return _doorStatus["doorOpen"] == false ? "Door Closed " : "Door Open";
  }

  void _fetchData() async{
    var response = await http.get("http://128.237.209.19");

    if(mounted){
      setState(() {
        this._doorStatus = json.decode(response.body);
      });
    }
  }
}
