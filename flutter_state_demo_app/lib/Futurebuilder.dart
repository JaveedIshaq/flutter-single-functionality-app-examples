import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeA extends StatefulWidget {
  HomeA({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeAState createState() => _HomeAState();
}

class _HomeAState extends State<HomeA> {
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
        body: FutureBuilder(
            future: _pageData(),
            builder: null)
    );
  }

  Future<List<String>> _pageData({bool hasError = false, bool hasData = true }) async {
    await Future.delayed(Duration(seconds: 2));

    if(hasError){
      return Future.error("There is an error while fetch ing Data from Future");
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
