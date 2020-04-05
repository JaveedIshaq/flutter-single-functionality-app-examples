import 'package:flutter/material.dart';
import 'package:flutterapp/home_page.dart';
import 'package:provider/provider.dart';

import 'voting_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider.value(
        value: VotingProvider(),
        child: MyHomePage(title: 'Voting App'),
      ),
    );
  }
}
