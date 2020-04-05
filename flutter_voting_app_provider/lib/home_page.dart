import 'package:flutter/material.dart';
import 'package:flutterapp/voting_provider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("build");
    final dataProvider = Provider.of<VotingProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            child: Center(
                child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: valueController,
              ),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                    onPressed: () {
                      dataProvider.addItem(valueController.text);
                    },
                    child: Text("Add Items")),
              ),
              Consumer<VotingProvider>(
                builder: (_, data, __) => Expanded(
                  child: ListView.builder(
                    itemCount: data.getData.length,
                    itemBuilder: (_, index) => ListTile(
                      onTap: () {
                        data.incrementVotes(index);
                      },
                      title: Text(data.getData[index]['title']),
                      trailing: CircleAvatar(
                        child: Text(data.getData[index]['votes'].toString()),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ))));
  }
}
