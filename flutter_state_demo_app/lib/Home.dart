import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> _listData = List<String>();
  bool get _fetchingData => _listData == null;


  @override

  void initState () {
    _pageData(hasError: false)
        .then((data) => setState((){
          if(data.length == 0){
            data.add('No data found for your account. Add something and check back');
          }
      _listData = data;
    }))
        .catchError((error) {
        setState(() {
          _listData = [error];
        });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        title: Text("Flutter State Demo"),
      ),
        body: Center(
          child: _fetchingData
          ? Center(
            child: CircularProgressIndicator(),
          )
          : ListView.builder(
              itemCount: _listData.length,
              itemBuilder: (buildContext, index) => _getListItemUI(index),
          ),
        )
    );
  }

  Future<List<String>> _pageData({bool hasError = false, bool hasData = true }) async {
    await Future.delayed(Duration(seconds: 2));

    if(hasError){
      return Future.error("There is an error while fetching Data from Future");
    }

    if(!hasData) {
      return List<String>();
    }
    return List.generate(7,(index) => "$index title");
  }

  Widget _getListItemUI(int index) {
    return  Container (
      margin: EdgeInsets.all(5.00),

      height: 50.00,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17.00),
        color: Colors.orange,
      ),
      child: Center(
        child: Text(_listData[index], style: TextStyle(color: Colors.white,))
      ),
    );
  }

}
