import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Layouts em Flutter'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              color: Colors.blue,
              height: 100,
              child: Center(
                child: Text(
                  'Container 1',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  color: Colors.green,
                  height: 100,
                  width: 100,
                  child: Center(
                    child: Text(
                      'Container 2',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  color: Colors.orange,
                  height: 100,
                  width: 100,
                  child: Center(
                    child: Text(
                      'Container 3',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                color: Colors.purple,
                child: Center(
                  child: Text(
                    'Container Expandido',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}