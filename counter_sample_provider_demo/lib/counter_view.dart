import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:counter_sample_provider_demo/counter_model.dart';


class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterModel = Provider.of<CounterModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App with Provider")
      ),
      body: Center(
        child: Text(
          "Counter value is: ${counterModel.getCounter()}",
          style: TextStyle(
            fontSize: 24.0
          ),
        )
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
            FloatingActionButton(
              onPressed: () => counterModel.incrementCounter(),
              tooltip: 'Increment',
              child: Icon(Icons.add),
              ),
              SizedBox(width:30),
              FloatingActionButton(
                onPressed: () => counterModel.decrementCounter(),
                tooltip: 'Decrement',
                child: Icon(Icons.remove),
                )
      ],),
    );
  }
}