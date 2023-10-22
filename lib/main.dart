import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MaterialApp(
    home: CalculatorApp(),
  ));
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  double firstnum = 0.0;
  double secnum = 0.0;
  var input = "";
  var output = "";
  var operation = "";
  onButtonClick(value) {
    //print(value);
    if (value == "C") {
      input = "";
      output = "";
    } else if (value == "=") {
      var userInput = input;
      //userInput= input.replaceAll(from, replace)
      Parser p = Parser();
      Expression expression = p.parse(userInput);
      ContextModel cm = ContextModel();
      var finalvalue = expression.evaluate(EvaluationType.REAL, cm);
      output = finalvalue.toString();
      //output = output.substring(0, output.length - 2);
    } else {
      input = input + value;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Column(children: [
        Expanded(
            child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(input,
                          style: TextStyle(fontSize: 36, color: Colors.white)),
                      SizedBox(height: 40),
                      Text(output,
                          style: TextStyle(
                              fontSize: 28,
                              color: Colors.white.withOpacity(0.7)))
                    ]),
                color: Colors.black)),
        SizedBox(height: 40),
        Row(
          children: [
            button(text: "7", tcolor: Colors.green, tbgcolor: Colors.black),
            button(text: "8", tcolor: Colors.green, tbgcolor: Colors.black),
            button(text: "9", tcolor: Colors.green, tbgcolor: Colors.black),
            button(text: "/", tcolor: Colors.white, tbgcolor: Colors.green),
          ],
        ),
        Row(
          children: [
            button(text: "4", tcolor: Colors.green, tbgcolor: Colors.black),
            button(text: "5", tcolor: Colors.green, tbgcolor: Colors.black),
            button(text: "6", tcolor: Colors.green, tbgcolor: Colors.black),
            button(text: "*", tcolor: Colors.white, tbgcolor: Colors.green),
          ],
        ),
        Row(
          children: [
            button(text: "1", tcolor: Colors.green, tbgcolor: Colors.black),
            button(text: "2", tcolor: Colors.green, tbgcolor: Colors.black),
            button(text: "3", tcolor: Colors.green, tbgcolor: Colors.black),
            button(text: "-", tcolor: Colors.white, tbgcolor: Colors.green),
          ],
        ),
        Row(
          children: [
            button(text: "0", tcolor: Colors.green, tbgcolor: Colors.black),
            button(text: "C", tcolor: Colors.green, tbgcolor: Colors.black),
            button(text: "=", tcolor: Colors.white, tbgcolor: Colors.green),
            button(text: "+", tcolor: Colors.white, tbgcolor: Colors.green),
          ],
        )
      ]),
    );
  }

  Widget button({text, tcolor, tbgcolor}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: tbgcolor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.all(22),
          ),
          onPressed: () => onButtonClick(text),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: tcolor),
          ),
        ),
      ),
    );
  }
}
