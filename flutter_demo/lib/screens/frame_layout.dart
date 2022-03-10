import 'package:flutter/material.dart';

class FrameLayoutPage extends StatelessWidget {
  const FrameLayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Frame Layout'),
        ),
        body: Stack(
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: Container(color: Colors.green),
            ),
            SizedBox(
              height: 200,
              width: 200,
              child: Container(color: Colors.yellow),
            ),
            SizedBox(
              height: 100,
              width: 100,
              child: Container(color: Colors.red),
            )
          ],
        ));
  }
}
