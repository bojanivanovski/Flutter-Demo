

import 'package:flutter/material.dart';

class ThemeExample extends StatelessWidget {
  const ThemeExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(onPressed: () {}, child: Text('Root Theme Data')),
            Theme(
              data: ThemeData(
                primarySwatch: Colors.green,
              ),
              child: ElevatedButton(onPressed: () {}, child: Text('Local Theme Data')),
            )
          ],
        ),
      ),
    );
  }
}
