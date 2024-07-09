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
          title: Text('Meu Primeiro App Flutter para Web'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Olá, Flutter!',
                style: TextStyle(fontSize: 24),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(16.0),
                    color: Colors.blue,
                    child: Text(
                      'Container 1',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    color: Colors.red,
                    child: Text(
                      'Container 2',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  'Container com borda arredondada',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  print('Botão Pressionado!');
                },
                child: Text('Pressione-me!'),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.map),
                      title: Text('Mapa'),
                    ),
                    ListTile(
                      leading: Icon(Icons.photo),
                      title: Text('Fotos'),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('Telefone'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}