import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// Here we use [setState] once the data is received from network
/// but we don't react to loading state or error state
class AsyncUIExample extends StatefulWidget {
  const AsyncUIExample({Key? key}) : super(key: key);

  @override
  _AsyncUIExampleState createState() => _AsyncUIExampleState();
}

class _AsyncUIExampleState extends State<AsyncUIExample> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AsyncUI Example'),
      ),
      body: ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (BuildContext context, int position) {
          return getRow(position);
        },
      ),
    );
  }

  Widget getRow(int i) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text("Row ${widgets[i]["title"]}"),
    );
  }

  Future<void> loadData() async {
    var dataURL = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = jsonDecode(response.body);
    });
  }
}

/// Here we use [FutureBuilder] Widget to react accordingly to the future state
///
class FutureBuilderExample extends StatefulWidget {
  const FutureBuilderExample({Key? key}) : super(key: key);

  @override
  State<FutureBuilderExample> createState() => _FutureBuilderExampleState();
}

class _FutureBuilderExampleState extends State<FutureBuilderExample> {
  // the async call, its needed as param to the FutureBuilder
  // we save it as a State parameter so it doesn't get rebuild (recalled)
  // when the widget rebuilds
  late final Future<List> _future;

  @override
  void initState() {
    super.initState();
    _future = loadData();
  }

  Future<List> loadData() async {
    var dataURL = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    http.Response response = await http.get(dataURL);
    return jsonDecode(response.body);
  }

  Widget getRow(String title) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text('Row $title'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AsyncUI Example'),
      ),
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            // API call returned OK
            return ListView.builder(
              itemCount: (snapshot.data as List).length,
              itemBuilder: (BuildContext context, int position) {
                return getRow((snapshot.data as List)[position]['title']);
              },
            );
          } else if (snapshot.hasError) {
            // API call returned Error
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ];
          } else {
            // API call is in Loading state
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              )
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }
}
