import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Firbase CRUD Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Firestore firestore = Firestore.instance;

  Future<void>  _create() async {

    print("creat button is pressed");

    try {
      await firestore.collection("users").document("testUser").setData({
        'firstName' : 'test',
        'lastName' : 'user',
      });

    } catch (e) {
       print(e);
    }

  }

  Future<void> _read() async {
    print("read button is pressed");
    DocumentSnapshot documentSnapshot;
    try {
      documentSnapshot = await firestore.collection("users").document('testUser').get();
      print(documentSnapshot.data);
    } catch (e) {
      print(e);
    }

  }

  Future<void> _update() async {
    print("update button is pressed");

    try {
      firestore.collection("users").document('testUser').updateData({
        'firstName' : 'nameUpdated'
      });

    } catch (e) {

    }

  }

  Future<void> _delete() async{
    print("delete button is pressed");

    try {
       await firestore.collection("users").document("testUser").delete();
    } catch (e) {
     print(e);
    }
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
            RaisedButton(
                onPressed: _create,
                child: Text('Creat'),
            ),
            RaisedButton(
                onPressed: _read,
                child: Text('Read'),
            ),
            RaisedButton(
                onPressed: _update,
                child: Text('Update'),
            ),
            RaisedButton(
                onPressed: _delete,
                child: Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}
