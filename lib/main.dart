import 'package:flutter/material.dart';
import 'package:flutter_sqlite/DBHelper.dart';
import 'package:flutter_sqlite/Listnote.dart';
import 'package:flutter_sqlite/NotePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Note',
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var db = new DBHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
        backgroundColor: Colors.purple,
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => new NotePage(null, true))),
      ),
      appBar: AppBar(
        leading: Container(
            padding: EdgeInsets.all(8.0), child: Image.asset("img/logo.png")),
        title: Text('Simple Note',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.w300)),
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.grey[200],
      body: FutureBuilder(
        future: db.getNote(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          var data = snapshot.data;

          return snapshot.hasData
              ? new NoteList(data)
              : Center(
                  child: Text("No Data"),
                );
        },
      ),
    );
  }
}
