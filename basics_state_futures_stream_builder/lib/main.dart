import 'package:flutter/material.dart';
import 'dart:async';


void main() => runApp(ParentApp());


class ParentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilderDemo(),
    );
  }
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> _pageData;
  bool get _fetchingData => _pageData == null;

  Future<List<String>> _getListData ({bool hasError = false }) async {
   await Future.delayed(Duration(seconds: 2));

   if(hasError) {
     return Future.error("An error occured while Fetching the Data, Please try again");
   }
    return List<String>.generate(10, (index) => '$index title');
  }

 @override
 void initState() {
    _getListData(hasError: false).then((data) =>
         setState(() {
           _pageData = data;
         })
    ).catchError((error) =>
         setState(() {
           _pageData = [error];
         })
    );

    super.initState();
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text("State Future Stream Builder Demo"),
      ),
      body:
      _fetchingData
      ? Center(child: CircularProgressIndicator())
      : ListView.builder(
          itemCount: _pageData.length,
          itemBuilder: (buildContext, index) => _buildItem(index)
      ),
    );
  }

  // a custom function to return a Widget for the Widget Builder

Widget _buildItem (index) {
    return  Center(
      child: Card(
        color: Colors.lightBlue,
        child: InkWell(
          splashColor: Colors.red.withAlpha(30),
          onTap: () {},
          child: Container(
            width: 300,
            height: 100,
            child: Center(child: Text(_pageData[index])),
          ),
        ),
      ),
    );
}
}


class FutureBuilderDemo extends StatelessWidget {

  List<String> _pageData;
  bool get _fetchingData => _pageData == null;

  Future<List<String>> _getListData ({bool hasError = false }) async {
    await Future.delayed(Duration(seconds: 2));

    if(hasError) {
      return Future.error("An error occured while Fetching the Data, Please try again");
    }
    return List<String>.generate(10, (index) => '$index title');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _getListData(),
        builder: (buildContext, snapshot) {

          // error UI
          if(snapshot.hasError) {
            return _getInformationMessage(snapshot.error);
          }

          // Busy fetching Data
          if(!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          var listItems = snapshot.data;

          //listItems = [];

          //when empty Data is returned

          if(listItems.length == 0) {
            return _getInformationMessage("No Data found for your Account");
          }

          return ListView.builder(
              itemCount: listItems.length,
              itemBuilder: (buildContext, index){
                return  Center(
                  child: Card(
                    color: Colors.purpleAccent,
                    child: InkWell(
                      splashColor: Colors.red.withAlpha(30),
                      onTap: () {},
                      child: Container(
                        width: 300,
                        height: 100,
                        child: Center(child: Text(listItems[index])),
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }

  Widget _getInformationMessage(String message) {
    return Center(
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w900, color: Colors.grey[500]),
        ));
  }
}


enum HomeViewState { Busy, DataRetrieved, NoData }

class StreamBuilderDemo extends StatefulWidget {
  @override
  _StreamBuilderDemoState createState() => _StreamBuilderDemoState();
}

class _StreamBuilderDemoState extends State<StreamBuilderDemo> {
  final StreamController<HomeViewState> stateController = StreamController<HomeViewState>();
  List<String> listItems;

  @override
  void initState() {
    _getListData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          // We want to refresh, but this actually does nothing. Which is the limitation
          _getListData();
        }),
        backgroundColor: Colors.grey[900],
        body: StreamBuilder(
            stream: stateController.stream,
            builder: (buildContext, snapshot) {
              if (snapshot.hasError) {
                return _getInformationMessage(snapshot.error);
              }

              // Use busy indicator instead of hasData from snapShot
              if (!snapshot.hasData || snapshot.data == HomeViewState.Busy) {
                return Center(child: CircularProgressIndicator());
              }

              // use explicit state instead of checking the lenght
              if (snapshot.data == HomeViewState.NoData) {
                return _getInformationMessage(
                    'No data found for your account. Add something and check back.');
              }

              return ListView.builder(
                  itemCount: listItems.length,
                  itemBuilder: (buildContext, index) =>
                      _getListItemUi(index, listItems));
            }));
  }

  Future _getListData({bool hasError = false, bool hasData = true}) async {
    stateController.add(HomeViewState.Busy);
    await Future.delayed(Duration(seconds: 2));

    if (hasError) {
      return stateController.addError(
          'An error occurred while fetching the data. Please try again later.');
    }

    if (!hasData) {
      return stateController.add(HomeViewState.NoData);
    }

    listItems = List<String>.generate(10, (index) => '$index title');
    stateController.add(HomeViewState.DataRetrieved);
  }

  Widget _getListItemUi(int index, List<String> listItems) {
    return Container(
      margin: EdgeInsets.all(5.0),
      height: 50.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: Colors.grey[600]),
      child: Center(
        child: Text(
          listItems[index],
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _getInformationMessage(String message) {
    return Center(
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w900, color: Colors.grey[500]),
        ));
  }


}
