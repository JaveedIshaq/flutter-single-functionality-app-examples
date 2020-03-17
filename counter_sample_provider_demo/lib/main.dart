import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter_sample_provider_demo/counter_model.dart';
import 'package:counter_sample_provider_demo/counter_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: ChangeNotifierProvider<CounterModel>(
        create: (_) => CounterModel(),
        child: CounterView(),
        
        )
    );
  }
}
