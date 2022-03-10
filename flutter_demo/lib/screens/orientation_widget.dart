import 'package:flutter/material.dart';

class OrientationWidgetExample extends StatefulWidget {
  const OrientationWidgetExample({Key? key}) : super(key: key);

  @override
  State<OrientationWidgetExample> createState() =>
      _OrientationWidgetExampleState();
}

class _OrientationWidgetExampleState extends State<OrientationWidgetExample> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _incrementCounter,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? buildPortraitWidget()
              : buildLandscapeWidget();
        },
      ),
    );
  }

  Widget buildLandscapeWidget() {
    return Container(
      color: Colors.green,
      alignment: Alignment.center,
      child: Text(
        counter.toString(),
        style: TextStyle(
          fontSize: 64,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildPortraitWidget() {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text(
        counter.toString(),
        style: TextStyle(
          fontSize: 64,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }
}
