import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String input = "";
  String output = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculator App'),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    input,
                    style: TextStyle(fontSize: 48.0),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildButton("7"),
                  _buildButton("8"),
                  _buildButton("9"),
                  _buildButton("/"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildButton("4"),
                  _buildButton("5"),
                  _buildButton("6"),
                  _buildButton("*"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildButton("1"),
                  _buildButton("2"),
                  _buildButton("3"),
                  _buildButton("-"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildButton("0"),
                  _buildButton("C", textColor: Colors.red),
                  _buildButton("=", textColor: Colors.white, backgroundColor: Colors.blue),
                  _buildButton("+"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String label, {Color textColor = Colors.black, Color backgroundColor = Colors.white}) {
    return RaisedButton(
      child: Text(
        label,
        style: TextStyle(fontSize: 32.0, color: textColor),
      ),
      color: backgroundColor,
      padding: EdgeInsets.all(24.0),
      onPressed: () => _onButtonPressed(label),
    );
  }

  void _onButtonPressed(String label) {
    setState(() {
      switch (label) {
        case "C":
          input = "";
          output = "";
          break;
        case "+":
        case "-":
        case "*":
        case "/":
          if (input.isNotEmpty) {
            input += " $label ";
          }
          break;
        case "=":
          output = _calculate(input);
          break;
        default:
          input += label;
      }
    });
  }

  String _calculate(String input) {
    try {
      String result = "";
      List<String> parts = input.split(" ");
      double left = double.parse(parts[0]);
      String op = parts[1];
      double right = double.parse(parts[2]);

      switch (op) {
        case "+":
          result = (left + right).toString();
          break;
        case "-":
          result = (left - right).toString();
          break;
        case "*":
          result = (left * right).toString();
          break;
        case "/":
          result = (left / right).toString();
          break;
        default:
          throw Exception("Invalid operator");
      }

      return result;
    } catch (e) {
     
