import 'package:flutter/material.dart';

class RecycleView extends StatefulWidget {
  RecycleView({Key? key}) : super(key: key);

  @override
  _RecycleViewState createState() => _RecycleViewState();
}

class _RecycleViewState extends State<RecycleView> {
  List<Widget> widgets = [];
  late final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 100; i++) {
      widgets.add(getRow(i));
    }
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recycle View'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: widgets.length,
        itemBuilder: (BuildContext context, int position) {
          return getRow(position);
        },
      ),
    );
  }

  Widget getRow(int i) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // widgets.add(getRow(widgets.length));
          print('row $i');
        });
      },
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text('Row $i'),
      ),
    );
  }

  void _getMoreData() {
    List<Widget> newEntries =
        List.generate(10, (index) => getRow(widgets.length + index));
    setState(() {
      widgets.addAll(newEntries);
    });
  }
}
