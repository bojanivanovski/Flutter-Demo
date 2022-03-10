import 'package:flutter/material.dart';

class OverflowExample extends StatelessWidget {
  const OverflowExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              /// OVERFLOW ROW
              Row(
                children: const [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 4.0),
                    child: Icon(Icons.error),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child:
                        Text('Long error messageeeeeeeeeeeeeeeeeeeeeeeeeeeeee'),
                  ),
                  TextButton(onPressed: null, child: Text('Discard')),
                ],
              ),
              const SizedBox(
                height: 36,
              ),

              /// OVERFLOW FIXED
              Row(
                children: const [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 4.0),
                    child: Icon(Icons.error),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                          'Long error messageeeeeeeeeeeeeeeeeeeeeeeeeeeeee'),
                    ),
                  ),
                  TextButton(onPressed: null, child: Text('Discard')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
