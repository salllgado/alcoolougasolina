import 'package:flutter/material.dart';
import 'Strings.dart';
import 'ColorsExtension.dart';

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

  void handlerButtonTapped() {
    print(_gasolinaEditingController.text);
  }

  void handlerText(String text) {
//    if (text.length > 3) {
//      if (text.contains('.') == false ) {
//        _gasolinaEditingController.text = '.$text';
//      }
//    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            Strings.main_screen_title,
            style: TextStyle(
              color: HexColor("ebc200")
            ),
          ),
          backgroundColor: Colors.green
      ),
      body: Container(
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Container(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      Strings.main_screen_subtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: Strings.main_alcool_placeholder,
                          suffixStyle: TextStyle(
                            fontSize: 16,
                          )
                      ),
                      cursorColor: Colors.black,
                      maxLength: 5,
                      keyboardType: TextInputType.number,
                      controller: _alcoolEditingController,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: Strings.main_gasolina_placeholder,
                          suffixStyle: TextStyle(
                            fontSize: 16,
                          )
                      ),
                      cursorColor: Colors.black,
                      maxLength: 5,
                      keyboardType: TextInputType.number,
                      maxLengthEnforced: true,
                      onChanged: handlerText,
                      controller: _gasolinaEditingController,
                    ),
                  ),
                  SizedBox(
                    height: 44,
                    width: 288,
                    child: FlatButton(
                      child: Text(Strings.main_button_action),
                      textColor: HexColor("ebc200"),
                      color: Colors.green,
                      textTheme: ButtonTextTheme.primary,
                      onPressed: handlerButtonTapped,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
