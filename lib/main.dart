import 'package:flutter/material.dart';
import 'Strings.dart';
import 'ColorsExtension.dart';
import 'HEX.dart';

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
    var alcoolPrice = double.tryParse(_alcoolEditingController.text);
    var gasPrice = double.tryParse(_gasolinaEditingController.text);

    if (alcoolPrice == null || gasPrice == null) {
      showAlert("Números invalidos, tente novamente");
    }
    else {
      var result = (alcoolPrice/gasPrice);
      var resultString = result >= 0.7 ? "Gasolina" : "Alcool";
        var percent = (result * 100).round();
        showAlert("Abasteça com $resultString, o rendimento é de $percent%");
      }
    }

  void showAlert(String message) {
    showDialog(
      context: context,
      builder:  (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Resultado",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold
            ),
          ),
          content: Text(
            message,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "Recomeçar",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            Strings.main_screen_title,
            style: TextStyle(
              color: HexColor(HEX.goldYellow)
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
