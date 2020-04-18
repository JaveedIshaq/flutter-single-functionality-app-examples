import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Column(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
              height: 25.0,
            ),
            Text(
              "Units",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Units'),
                  DropdownButton<String>(
                    value: "settingsProvider.units",
                    onChanged: (String value) {
                      //settingsProvider.setUnits(value);
                    },
                    items: <String>['Imperial', 'Metric']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                          value: value, child: Text(value));
                    }).toList(),
                  )
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }
}
