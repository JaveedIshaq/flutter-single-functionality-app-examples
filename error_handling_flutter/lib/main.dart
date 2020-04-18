import 'package:flutter/material.dart';
import 'package:error_handling_flutter/post_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  final PostService postService = PostService();
  Future<Post> postFuture;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Error Handling")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FutureBuilder<Post>(
            future: postFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                final error = snapshot.error;
                return StyledText(error.toString());
              } else if (snapshot.hasData) {
                final post = snapshot.data;
                return StyledText(post.toString());
              } else {
                return StyledText('Press the button 👇');
              }
            },
          ),
          RaisedButton(
            child: Text('Get Post'),
            onPressed: () async {
              setState(() {
                postFuture = postService.getOnePost();
              });
            },
          ),
        ],
      )),
    );
  }
}

class StyledText extends StatelessWidget {
  const StyledText(
    this.text, {
    Key key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 40),
    );
  }
}
