import 'package:flutter/material.dart';

class LayoutBuilderExample extends StatelessWidget {
  const LayoutBuilderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size phoneSize = MediaQuery.of(context).size; // phone height and width
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            return const WidgetOne(showButton: true);
          }
          return Row(
            children: const [
              Expanded(child: WidgetOne(showButton: false)),
              Expanded(
                  child: WidgetTwo(
                showButton: false,
              ))
            ],
          );
        },
      ),
    );
  }
}

class WidgetOne extends StatelessWidget {
  const WidgetOne({Key? key, required this.showButton}) : super(key: key);

  final bool showButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
        child: showButton
            ? ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const WidgetTwo(
                            showButton: true,
                          )));
                },
                child: Text('Go to Widget2'))
            : Container(),
      ),
    );
  }
}

class WidgetTwo extends StatelessWidget {
  const WidgetTwo({Key? key, required this.showButton}) : super(key: key);

  final bool showButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: showButton
            ? ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Go back'))
            : Container(),
      ),
    );
  }
}
