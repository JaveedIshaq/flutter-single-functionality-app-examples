import 'package:flutter/material.dart';


  final membersArabic = [
   {
      "name":"\u0627\u0644\u062c\u062f \u0627\u0644\u0623\u0648\u0644",
      "user_id":"QF00001",
      "father_id":"QF00001",
      "father_name":"\u0627\u0644\u062c\u062f \u0627\u0644\u0623\u0648\u0644",
      "alive":"0",
      "sex":"1",
      "generation_number":0
   },
   {
      "name":"\u0643\u0645\u064a \u062a\u062c\u0631\u0628\u0629",
      "user_id":"QF01003",
      "father_id":"QF00001",
      "father_name":"\u0627\u0644\u062c\u062f \u0627\u0644\u0623\u0648\u0644",
      "alive":"1",
      "sex":"1",
      "generation_number":1
   },
   {
      "name":"\u0632\u0647\u0631\u0629",
      "user_id":"QF02004",
      "father_id":"QF01003",
      "father_name":"\u0643\u0645\u064a \u062a\u062c\u0631\u0628\u0629",
      "alive":"1",
      "sex":"2",
      "generation_number":2
   },
   {
      "name":"\u0623\u062d\u0645\u062f \u0627\u0644\u0639\u0644\u064a",
      "user_id":"QF02005",
      "father_id":"QF01003",
      "father_name":"\u0643\u0645\u064a \u062a\u062c\u0631\u0628\u0629",
      "alive":"0",
      "sex":"1",
      "generation_number":2
   },
   {
      "name":"\u062d\u0645\u062f\u0627\u0646",
      "user_id":"QF01006",
      "father_id":"QF00001",
      "father_name":"\u0627\u0644\u062c\u062f \u0627\u0644\u0623\u0648\u0644",
      "alive":"0",
      "sex":"1",
      "generation_number":1
   },
   {
      "name":"\u0633\u0627\u0631\u0629",
      "user_id":"QF02007",
      "father_id":"QF01006",
      "father_name":"\u062d\u0645\u062f\u0627\u0646",
      "alive":"0",
      "sex":"2",
      "generation_number":2
   },
   {
      "name":"\u0645\u064a\u062b\u0629",
      "user_id":"QF02008",
      "father_id":"QF01003",
      "father_name":"\u0643\u0645\u064a \u062a\u062c\u0631\u0628\u0629",
      "alive":"0",
      "sex":"2",
      "generation_number":2
   },
   {
      "name":"\u0642\u0627\u0633\u0645",
      "user_id":"QF02009",
      "father_id":"QF01003",
      "father_name":"\u0643\u0645\u064a \u062a\u062c\u0631\u0628\u0629",
      "alive":"0",
      "sex":"1",
      "generation_number":2
   },
   {
      "name":"\u0645\u0635\u0637\u0641\u0649",
      "user_id":"QF02010",
      "father_id":"QF01006",
      "father_name":"\u062d\u0645\u062f\u0627\u0646",
      "alive":"0",
      "sex":"1",
      "generation_number":2
   },
   {
      "name":"\u0633\u0627\u0645\u0631",
      "user_id":"QF03011",
      "father_id":"QF02010",
      "father_name":"\u0645\u0635\u0637\u0641\u0649",
      "alive":"0",
      "sex":"1",
      "generation_number":3
   },
   {
      "name":"\u0634\u062f\u0627\u062f",
      "user_id":"QF03012",
      "father_id":"QF02010",
      "father_name":"\u0645\u0635\u0637\u0641\u0649",
      "alive":"1",
      "sex":"1",
      "generation_number":3
   }
];


   final membersArabicRecent = [
   {
      "name":"\u0627\u0644\u062c\u062f \u0627\u0644\u0623\u0648\u0644",
      "user_id":"QF00001",
      "father_id":"QF00001",
      "father_name":"\u0627\u0644\u062c\u062f \u0627\u0644\u0623\u0648\u0644",
      "alive":"0",
      "sex":"1",
      "generation_number":0
   }
];



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Family Members Search App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Family Members Search App'),
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){
            showSearch(
            context: context,
            delegate: DataSearch()
            );
          })
        ],
      ),
      body: Center(        
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFE57C)
          ),
        child: new ListView.builder(
          itemExtent: 100.0,
          itemCount:membersArabic.length,
          itemBuilder: (buildContext, index) => _buildItem(index)
        ),
      ),
    )
    );
  }

  Widget _buildItem (index) {
    return  Center(
      child: Card(
        elevation: 10.0,
        margin: EdgeInsets.all(5.0),
        color: Colors.white,
        child: InkWell(
          splashColor: Colors.red.withAlpha(30),
          onTap: () {

               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MemberView(memberIndex: index)),
              );

          },
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Color(0xFFFFE57C),
                   shape: BoxShape.circle,
                   
                ),
                width: 100,
                height: 100,
                child: Center(
                  child: Text(membersArabic[index]['name'],
                  style: TextStyle(
                      fontWeight : FontWeight.bold
                  ),
                )),
              ),
               Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Text("${membersArabic[index]['name']}",
                      style: TextStyle(
                        fontSize: 22.0
                      ),
                   ),

                   membersArabic[index]["alive"] == "1"
                   ? Text("رحمه الله", 
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0
                      ),
                   )
                   : Text(" ")
                 ]
               )
            ],
          ),
        ),
      ),
    );
}

  
}




class DataSearch extends SearchDelegate<Map> {

  
  @override
  List<Widget> buildActions(BuildContext context) {
    // leading icon on the left of the app bar
    return[
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = "";
        },
        )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
        ), 
        onPressed:(){
           close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some results based on the search query
    return Card(
         child: Center(child: Text("membersEnglish[index]['name']")),   
      );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
      ? membersArabicRecent
      : membersArabic.where((member) => member['name'].toString().contains(query));

    return ListView.builder(
          itemCount: suggestionList.length,
          itemBuilder: (context, index) => ListTile(
            onTap: (){
              //showResults(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MemberView(memberIndex: index)),
              );
            },
            leading: Icon(Icons.person),
            title: Text(membersArabic[index]['name']),
          )
          );
  }

}



class MemberView extends StatelessWidget {

   MemberView({Key key, this.memberIndex}) : super(key: key);

  final int memberIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text(membersArabic[memberIndex]['name']),
          ),
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
                Card(
                   child: Column(
                     children: <Widget>[
                       Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Color(0xFF242011),
                   shape: BoxShape.circle,
                   
                ),
                width: 150,
                height: 150,
                child: Center(
                  child: Text(membersArabic[memberIndex]['name'],
                  style: TextStyle(
                      fontWeight : FontWeight.bold,
                      fontSize: 30.0,
                      color: Colors.white
                  ),
                )),
              ),
              membersArabic[memberIndex]["alive"] == "1"
                   ? Text("رحمه الله", 
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0
                      ),
                   )
                   : Text(" "),
                    FlatButton(
                      onPressed: (){},
                      child: Text("الجد : ${membersArabic[memberIndex]["father_name"]}",
                      style: TextStyle(
                        fontSize: 18.0
                      ),
                      )
                      )
        
                     ],
                   )
                ),
            ],
 
          ),
    );
  }
}
