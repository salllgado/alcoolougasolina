import 'package:flutter/material.dart';
import 'Strings.dart'

void main() => runApp(MainScreen());

class MainScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Text("Alcool ou Gasolina"),
      color: Colors.lightGreen,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(4),
              child: Text(Strings.main_screen_subtitle),
            ),
            Padding(
              padding: EdgeInsets.all(4),
              child: TextField(
                decoration: InputDecoration(
                  labelText: Text("")
                ),
                cursorColor: Colors.black,
                maxLength: 5,
                keyboardType: TextInputType.number,
                controller: ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
