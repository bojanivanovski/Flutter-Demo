import 'package:flutter/material.dart';

class ScrollViewExample extends StatelessWidget {
  const ScrollViewExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Scroll View'),
        ),
        body: ListView(
          children: const [
            ListTile(title: Text('Example 1'), subtitle: Text('Subtitle'),),
            ListTile(title: Text('Example 2'), subtitle: Text('Subtitle'),),
            ListTile(title: Text('Example 3'), subtitle: Text('Subtitle'),),
            ListTile(title: Text('Example 4'), subtitle: Text('Subtitle'),),
            ListTile(title: Text('Example 5'), subtitle: Text('Subtitle'),),
            ListTile(title: Text('Example 6'), subtitle: Text('Subtitle'),),
            ListTile(title: Text('Example 7'), subtitle: Text('Subtitle'),),
            ListTile(title: Text('Example 8'), subtitle: Text('Subtitle'),),
            ListTile(title: Text('Example 9'), subtitle: Text('Subtitle'),),
            ListTile(title: Text('Example 10'), subtitle: Text('Subtitle'),),
          ],
        ));
  }
}
