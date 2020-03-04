import 'package:flutter/material.dart';
import 'dart:math';

void main () => runApp(Home());


class DiscData {
  static final _range = Random();
  double size;
  Color color;
  Alignment alignment;

  DiscData() {
    color = Color.fromARGB(
        _range.nextInt(200), _range.nextInt(255), _range.nextInt(255),
        _range.nextInt(255));
    size = _range.nextDouble() * 40 + 10;
    alignment = Alignment(
        _range.nextDouble() * 2 - 1,
        _range.nextDouble() * 2 - 1
    );
  }
}


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
       title: "Flutter Animation Demo by Javeed",
       home: Scaffold(
         appBar: AppBar(
           title: Text("Flutter Animation Demo by Javeed"),
         ),
         body: Container(
           color: Color(0xFF15202D),
           child: SizedBox.expand(
             child: AnimatedDiscs(50),
           ),
         ),
       ),
    );
  }
}

class AnimatedDiscs extends StatefulWidget {
  final numberOfDiscs;
  AnimatedDiscs(this.numberOfDiscs);

  @override
  _AnimatedDiscsState createState() => _AnimatedDiscsState();
}

class _AnimatedDiscsState extends State<AnimatedDiscs> {

  final _discs = <DiscData>[];

  @override
  void initState() {
    super.initState();
    _makeDiscs();
  }

  void _makeDiscs() {
    _discs.clear();
    for (int i = 0; i < widget.numberOfDiscs; i++) {
      _discs.add(DiscData());
    }
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        _makeDiscs();
      }),
      child: Stack(
        children: <Widget>[
          Center(
            child: Text(
              "Tap on a Disc to Animate",
              style: TextStyle(color: Colors.amber, fontSize: 30.0),

            ),
          ),

          for ( final disc in _discs)
            Positioned.fill(
                child: AnimatedAlign(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  alignment: disc.alignment,
                  child: AnimatedContainer(
                      duration: Duration(milliseconds: 2000),
                      decoration: BoxDecoration(
                        color: disc.color,
                        shape: BoxShape.circle,
                      ),
                    height: disc.size,
                    width: disc.size,
                  ),
                ))
        ],
      ),
    );
  }
}

