import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import 'package:barcode_scan/barcode_scan.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Localhost Rest Api'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  String api_url = "http://192.168.100.11:3000/list";
//  String api_url = "http://localhost:3000/list";
  List data_from_api = [];



  Future<String> _showRestData() async {

    var response_rest = await http.post(Uri.encodeFull(api_url),
        headers: {"Accept": "application/json"});

    setState(() {
      data_from_api = json.decode(response_rest.body);
    });

    print(data_from_api);

  }


  @override
  void initState() {
    _showRestData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showRestData,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
