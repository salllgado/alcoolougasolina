import 'package:flutter/material.dart';
import 'Strings.dart';

void main() {
  runApp(MaterialApp(
      home: MainPage(),
    ));
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  // setup alcool controller
  TextEditingController _alcoolEditingController = TextEditingController();

  // setup gasolina controller
  TextEditingController _gasolinaEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(Strings.main_screen_title),
          backgroundColor: Colors.green
      ),
      body: Container(
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
                      labelText: Strings.main_screen_subtitle
                  ),
                  cursorColor: Colors.black,
                  maxLength: 5,
                  keyboardType: TextInputType.number,
                  controller: _alcoolEditingController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
