import 'package:flutter/material.dart';

class AddOrRemoveComponent extends StatefulWidget {
  const AddOrRemoveComponent({Key? key}) : super(key: key);

  @override
  _AddOrRemoveComponentState createState() => _AddOrRemoveComponentState();
}

class _AddOrRemoveComponentState extends State<AddOrRemoveComponent> {
// Default value for toggle.
  bool toggle = true;

  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  Widget _getToggleChild() {
    if (toggle) {
      return Text('Toggle One');
    } else {
      return ElevatedButton(
        onPressed: () {},
        child: Text('Toggle Two'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add or Remove Component'),
      ),
      body: Center(
        child: _getToggleChild(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'Update Text',
        child: Icon(Icons.update),
      ),
    );
  }
}
