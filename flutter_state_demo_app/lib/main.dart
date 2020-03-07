import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterstatedemoapp/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(title: 'Flutter State Management Demo'),
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
  int _counter = 0;
  List<String> _pageData;

  @override
  void initState() {
    // TODO: implement initState
    _getPageData().then((data) => setState(() {
          _pageData = data;
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: _pageData.length,
          itemBuilder: (buildContext, index) => Container (
            margin: EdgeInsets.all(7.00),
            height: 50,
            color: Colors.green,
            child: Center(child: Text(_pageData[index])),

          )
         )
      );
  }

  Future<List<String>> _getPageData() async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(10, (index) => '$index title');
  }
}
