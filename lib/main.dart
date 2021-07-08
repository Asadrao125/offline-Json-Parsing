import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JSON',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("JOSN"),
        ),
        body: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString("asset/data.json"),
          builder: (context, snapshot) {
            var myData = json.decode(snapshot.data.toString());
            if (myData == null) {
              return Center(
                child: Text(
                  "Loading...",
                  style: new TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              );
            } else {
              return Center(
                child: Text(
                  // For JSON Array
                  myData[1]["city"],

                  // For JSON Array of Items in JSON Object
                  //myData["Items"][0]["city"],

                  // For JSON Object
                  //myData["2"]["name"]
                  style: new TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              );
            }
          },
        ));
  }
}
