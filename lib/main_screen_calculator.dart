import 'dart:core';
import 'dart:math';

import 'package:calculator_test/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
double logBase(num x, num base) => log(x) / log(base);
const double pi = 3.1415926535897932;
const double eConst= e;

factorial(var number){
  int factorial=1;
  for( int i = number; i >= 1; i-- ) {
    factorial =factorial*i ;
  }
  return factorial;
}
class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String option = '';
  int index = 0;
  double second = 0;
  double first = 0;
  String userInput = '0';
  String number = '';
  double answerDouble = 0;
  int answerInt=0;
  double answer = 0;
  num third =0;


  late bool isOk;
  late bool isOkSideButton;

  @override
  void initState() {
    super.initState();
    isOk = userInput.contains("-") ||
        userInput.contains("+") ||
        userInput.contains("*") ||
        userInput.contains("/") ||
        userInput.contains("%") ||
        userInput.contains("sqrt(") ||
        userInput.contains("sin(") ||
        userInput.contains("cos(") ||
        userInput.contains("tan(") ||
        userInput.contains("log(") ||
        userInput.contains("ln(") ||
        userInput.contains("!(") ||
        userInput.contains("^");
    isOkSideButton = userInput.contains("-") ||
        userInput.contains("+") ||
        userInput.contains("*") ||
        userInput.contains("/") ||
        userInput.contains("%") ||
        userInput.contains("sqrt(") ||
        userInput.contains("sin(") ||
        userInput.contains("cos(") ||
        userInput.contains("tan(") ||
        userInput.contains("log(") ||
        userInput.contains("ln(") ||
        userInput.contains("!(") ||
        userInput.contains("^");

  }

  final scaffoldState = GlobalKey<ScaffoldState>();

  bool selected = false;
  bool moveInput = false;
  bool opened = false;
  void _showSheet() {
    // Show BottomSheet here using the Scaffold state instead ot«f the Scaffold context
    scaffoldState.currentState
        ?.showBottomSheet(

            (context) => Padding(
      padding: EdgeInsets.only(
            // top: 20,  right: 20,  left: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 30,
                  width: double.infinity,
                  color: Colors.black,
                  child: IconButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () {

                      setState(() {
                        moveInput=false;
                        Navigator.pop(context);
                      });

                    },
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      flex:1,
                      child: buildModalBottomTextButton("INV")),
                  Expanded(
                      flex: 1,
                      child: buildModalBottomTextButton("RAD")),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                        child: const Text(
                          "%",
                          style: TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                        onPressed: () {
                          setState(() {
                            option = "%";
                            if (userInput.contains("-") ||
                                userInput.contains("+") ||
                                userInput.contains("*") ||
                                userInput.contains("/") ||
                                userInput.contains("%") ||
                                userInput.contains("sqrt(") ||
                                userInput.contains("sin(") ||
                                userInput.contains("cos(") ||
                                userInput.contains("tan(") ||
                                userInput.contains("log(") ||
                                userInput.contains("ln(") ||
                                userInput.contains("!(") ||
                                userInput.contains("^")) {

                              if (second == 0) {
                                // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));
                                // answer = answer + sum;

                                userInput = userInput + '%';
                                index = userInput.length;
                              } else {
                                first = first * second/100;
                                userInput = userInput + '%';
                                index = userInput.length;

                                second = 0;
                              }
                            } else {
                              first = double.parse(userInput);
                              // sum = int.parse(userInput);
                              // answer = answer + sum;

                              userInput = userInput + '%';
                              index = userInput.length;
                            }
                            if (second == 0) {
                              answer = 0;
                            } else {
                              answerDouble = first * second/100;
                            }

                            second = 0;

                          });
                        }),),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                        child: const Text(
                          "sqrt",
                          style: TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                        onPressed: () {
                          setState(() {
                            option = "sqrt(";
                            // if(userInput=="0"){
                            //   userInput="sqrt(";
                            // }
                            if (userInput.contains("-") ||
                                userInput.contains("+") ||
                                userInput.contains("*") ||
                                userInput.contains("/") ||
                                userInput.contains("%") ||
                                userInput.contains("sqrt(") ||
                                userInput.contains("sin(") ||
                                userInput.contains("cos(") ||
                                userInput.contains("tan(") ||
                                userInput.contains("log(") ||
                                userInput.contains("ln(") ||
                                userInput.contains("!(") ||
                                userInput.contains("^")) {

                              index = userInput.length-1;
                              if (second == 0) {
                                // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));
                                // answer = answer + sum;

                                userInput =  'sqrt(' + userInput ;
                                index = userInput.length-1;
                              } else {
                                first = sqrt(first);
                                userInput =  'sqrt('+ userInput ;
                                index = userInput.length;

                                second = 0;
                              }
                            } else {
                              first = double.parse(userInput);
                              // sum = int.parse(userInput);
                              // answer = answer + sum;

                              userInput = 'sqrt('+userInput  ;
                              index = userInput.length-1;
                            }
                            if (second == 0) {
                              answer = 0;
                            } else {
                              answerDouble = sqrt(first);
                            }

                            second = 0;

                          });
                        }),),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex:1,
                    child: TextButton(
                        child: const Text(
                          "sin",
                          style: TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                        onPressed: () {
                          setState(() {
                            option = "sin(";
                            // if(userInput=="0"){
                            //   userInput="sqrt(";
                            // }
                            if (userInput.contains("-") ||
                                userInput.contains("+") ||
                                userInput.contains("*") ||
                                userInput.contains("/") ||
                                userInput.contains("%") ||
                                userInput.contains("sqrt(") ||
                                userInput.contains("sin(") ||
                                userInput.contains("cos(") ||
                                userInput.contains("tan(") ||
                                userInput.contains("log(") ||
                                userInput.contains("ln(") ||
                                userInput.contains("!(") ||
                                userInput.contains("^")
                            ) {

                              index = userInput.length-1;
                              if (second == 0) {
                                // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));
                                // answer = answer + sum;

                                userInput =  'sin(' + userInput ;
                                index = userInput.length-1;
                              } else {
                                first = sin(first);
                                userInput =  'sin('+ userInput ;
                                index = userInput.length;

                                second = 0;
                              }
                            } else {
                              first = double.parse(userInput);
                              // sum = int.parse(userInput);
                              // answer = answer + sum;

                              userInput = 'sin('+userInput  ;
                              index = userInput.length-1;
                            }
                            if (second == 0) {
                              answer = 0;
                            } else {
                              answerDouble = sin(first);
                            }

                            second = 0;

                          });
                        }),),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                        child: const Text(
                          "cos",
                          style: TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                        onPressed: () {
                          setState(() {
                            option = "cos(";
                            // if(userInput=="0"){
                            //   userInput="sqrt(";
                            // }
                            if (userInput.contains("-") ||
                                userInput.contains("+") ||
                                userInput.contains("*") ||
                                userInput.contains("/") ||
                                userInput.contains("%") ||
                                userInput.contains("sqrt(") ||
                                userInput.contains("sin(") ||
                                userInput.contains("cos(") ||
                                userInput.contains("tan(") ||
                                userInput.contains("log(") ||
                                userInput.contains("ln(") ||
                                userInput.contains("!(") ||
                                userInput.contains("^")
                            ) {

                              index = userInput.length-1;
                              if (second == 0) {
                                // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));
                                // answer = answer + sum;

                                userInput =  'cos(' + userInput ;
                                index = userInput.length-1;
                              } else {
                                first = cos(first);
                                userInput =  'cos('+ userInput ;
                                index = userInput.length;

                                second = 0;
                              }
                            } else {
                              first = double.parse(userInput);
                              // sum = int.parse(userInput);
                              // answer = answer + sum;

                              userInput = 'cos('+userInput  ;
                              index = userInput.length-1;
                            }
                            if (second == 0) {
                              answer = 0;
                            } else {
                              answerDouble = cos(first);
                            }

                            second = 0;

                          });
                        }),),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                        child: const Text(
                          "tan",
                          style: TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                        onPressed: () {
                          setState(() {
                            option = "tan(";
                            // if(userInput=="0"){
                            //   userInput="sqrt(";
                            // }
                            if (userInput.contains("-") ||
                                userInput.contains("+") ||
                                userInput.contains("*") ||
                                userInput.contains("/") ||
                                userInput.contains("%") ||
                                userInput.contains("sqrt(") ||
                                userInput.contains("sin(") ||
                                userInput.contains("cos(") ||
                                userInput.contains("tan(") ||
                                userInput.contains("log(") ||
                                userInput.contains("ln(") ||
                                userInput.contains("!(") ||
                                userInput.contains("^")
                            ) {

                              index = userInput.length-1;
                              if (second == 0) {
                                // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));
                                // answer = answer + sum;

                                userInput =  'tan(' + userInput ;
                                index = userInput.length-1;
                              } else {
                                first = tan(first);
                                userInput =  'tan('+ userInput ;
                                index = userInput.length;

                                second = 0;
                              }
                            } else {
                              first = double.parse(userInput);
                              // sum = int.parse(userInput);
                              // answer = answer + sum;

                              userInput = 'tan('+userInput  ;
                              index = userInput.length-1;
                            }
                            if (second == 0) {
                              answer = 0;
                            } else {
                              answerDouble = tan(first);
                            }

                            second = 0;

                          });
                        }),),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                        child: const Text(
                          "ln",
                          style: TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                        onPressed: () {
                          setState(() {
                            option = "ln(";
                            // if(userInput=="0"){
                            //   userInput="sqrt(";
                            // }
                            if (userInput.contains("-") ||
                                userInput.contains("+") ||
                                userInput.contains("*") ||
                                userInput.contains("/") ||
                                userInput.contains("%") ||
                                userInput.contains("sqrt(") ||
                                userInput.contains("sin(") ||
                                userInput.contains("cos(") ||
                                userInput.contains("tan(") ||
                                userInput.contains("log(") ||
                                userInput.contains("ln(") ||
                                userInput.contains("!(") ||
                                userInput.contains("^")
                            ) {

                              index = userInput.length-1;
                              if (second == 0) {
                                // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));
                                // answer = answer + sum;

                                userInput =  'ln(' + userInput ;
                                index = userInput.length-1;
                              } else {
                                first = logBase(first, eConst);
                                userInput =  'ln('+ userInput ;
                                index = userInput.length;

                                second = 0;
                              }
                            } else {
                              first = double.parse(userInput);
                              // sum = int.parse(userInput);
                              // answer = answer + sum;

                              userInput = 'ln('+userInput  ;
                              index = userInput.length-1;
                            }
                            if (second == 0) {
                              answer = 0;
                            } else {
                              answerDouble = logBase(first, eConst);
                            }

                            second = 0;

                          });
                        }),),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex:1,
                    child: TextButton(
                        child: const Text(
                          "log",
                          style: TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                        onPressed: () {
                          setState(() {
                            option = "log(";
                            // if(userInput=="0"){
                            //   userInput="sqrt(";
                            // }
                            if (userInput.contains("-") ||
                                userInput.contains("+") ||
                                userInput.contains("*") ||
                                userInput.contains("/") ||
                                userInput.contains("%") ||
                                userInput.contains("sqrt(") ||
                                userInput.contains("sin(") ||
                                userInput.contains("cos(") ||
                                userInput.contains("tan(") ||
                                userInput.contains("log(") ||
                                userInput.contains("ln(") ||
                                userInput.contains("!(") ||
                                userInput.contains("^")
                            ) {

                              index = userInput.length-1;
                              if (second == 0) {
                                // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));
                                // answer = answer + sum;

                                userInput =  'log(' + userInput ;
                                index = userInput.length-1;
                              } else {
                                first = logBase(first, 10);
                                userInput =  'log('+ userInput ;
                                index = userInput.length;

                                second = 0;
                              }
                            } else {
                              first = double.parse(userInput);
                              // sum = int.parse(userInput);
                              // answer = answer + sum;

                              userInput = 'log('+userInput  ;
                              index = userInput.length-1;
                            }
                            if (second == 0) {
                              answer = 0;
                            } else {
                              answerDouble = logBase(first, 10);
                            }

                            second = 0;

                          });
                        }),),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                        child: const Text(
                          "!",
                          style: TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                        onPressed: () {
                          setState(() {
                            option = "!(";
                            // if(userInput=="0"){
                            //   userInput="sqrt(";
                            // }
                            if (userInput.contains("-") ||
                                userInput.contains("+") ||
                                userInput.contains("*") ||
                                userInput.contains("/") ||
                                userInput.contains("%") ||
                                userInput.contains("sqrt(") ||
                                userInput.contains("sin(") ||
                                userInput.contains("cos(") ||
                                userInput.contains("tan(") ||
                                userInput.contains("log(") ||
                                userInput.contains("ln(") ||
                                userInput.contains("!(") ||
                                userInput.contains("^")
                            ) {

                              index = userInput.length-1;
                              if (second == 0) {
                                // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));
                                // answer = answer + sum;

                                userInput =  '!(' + userInput ;
                                index = userInput.length-1;
                              } else {
                                answerInt = factorial(first.toInt());
                                first = answerInt.toDouble();
                                // first = factorial(first.toInt());
                                userInput =  '!('+ userInput ;
                                index = userInput.length;

                                second = 0;
                              }
                            } else {
                              first = double.parse(userInput);
                              // sum = int.parse(userInput);
                              // answer = answer + sum;

                              userInput = '!('+userInput  ;
                              index = userInput.length-1;
                            }
                            if (second == 0) {
                              answer = 0;
                            } else {
                              answerInt = factorial(first.toInt());
                              first = answerInt.toDouble();
                              // answer_double = factorial(first.toInt()) ;
                            }

                            second = 0;

                          });
                        }),),
                  Expanded(
                      flex: 1,
                      child: TextButton(
                          child: const Text(
                            "Pi",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white),
                          ),
                          onPressed: () {
                            setState(() {
                              if (userInput == '0') {
                                userInput = pi.toString();
                              } else if (!userInput.contains("+") &&
                                  !userInput.contains("-") &&
                                  !userInput.contains("*") &&
                                  !userInput.contains("/") &&
                                  !userInput.contains("%") &&
                                  !userInput.contains("sqrt(") &&
                                  !userInput.contains("sin(") &&
                                  !userInput.contains("cos(") &&
                                  !userInput.contains("tan(") &&
                                  !userInput.contains("log(") &&
                                  !userInput.contains("ln(") &&
                                  !userInput.contains("!(") &&
                                  !userInput.contains("^")) {
                                userInput = userInput + pi.toString();
                                // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));

                              } else {
                                userInput = userInput + pi.toString();
                                second = double.parse(userInput
                                    .substring(userInput.length -
                                    (userInput.length -
                                        index)));

                              }
                            });
                          })),
                  Expanded(
                      flex: 1,
                      child: TextButton(
                          child: const Text(
                            "e",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white),
                          ),
                          onPressed: () {
                            setState(() {
                              if(userInput.contains("log(0")) {
                                userInput="log("+eConst.toString();
                                first = double.parse(userInput
                                    .substring(userInput.length -
                                    (userInput.length -
                                        index)));
                              }
                              // else if(userInput.contains("ln(0")) {
                              //   userInput="ln("+e_const.toString();
                              //   first = double.parse(userInput
                              //       .substring(userInput.length -
                              //       (userInput.length -
                              //           index)));
                              // }
                              if (userInput == '0') {
                                userInput = e.toString();
                              } else if (!userInput.contains("+") &&
                                  !userInput.contains("-") &&
                                  !userInput.contains("*") &&
                                  !userInput.contains("/") &&
                                  !userInput.contains("%") &&
                                  !userInput.contains("sqrt(") &&
                                  !userInput.contains("sin(") &&
                                  !userInput.contains("cos(") &&
                                  !userInput.contains("tan(") &&
                                  !userInput.contains("log(") &&
                                  !userInput.contains("ln(") &&
                                  !userInput.contains("!(") &&
                                  !userInput.contains("^")

                              ) {
                                userInput = userInput + e.toString();
                                // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));

                              } else {
                                userInput = userInput + e.toString();
                                second = double.parse(userInput
                                    .substring(userInput.length -
                                    (userInput.length -
                                        index)));

                              }
                            });
                          })),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex:1,
                    child: TextButton(
                        child: const Text(
                          "^",
                          style: TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                        onPressed: () {
                          setState(() {
                            option = "^";
                            // if(userInput=="0"){
                            //   userInput="sqrt(";
                            // }
                            if (userInput.contains("-") ||
                                userInput.contains("+") ||
                                userInput.contains("*") ||
                                userInput.contains("/") ||
                                userInput.contains("%") ||
                                userInput.contains("sqrt(") ||
                                userInput.contains("sin(") ||
                                userInput.contains("cos(") ||
                                userInput.contains("tan(") ||
                                userInput.contains("log(") ||
                                userInput.contains("^")
                            ) {

                              index = userInput.length;
                              if (second == 0) {
                                // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));
                                // answer = answer + sum;

                                userInput = userInput +'^';
                                index = userInput.length;
                              } else {
                                third = pow(first, second);
                                first =third.toDouble();
                                userInput =  userInput +'^';
                                index = userInput.length;

                                second = 0;
                              }
                            } else {
                              first = double.parse(userInput);
                              // sum = int.parse(userInput);
                              // answer = answer + sum;

                              userInput = userInput +'^' ;
                              index = userInput.length;
                            }
                            if (second == 0) {
                              answer = 0;
                            } else {
                              third = pow(first, second);
                              first =third.toDouble();
                            }

                            second = 0;

                          });
                        }),),
                  Expanded(
                      flex: 1,
                      child: buildModalBottomTextButton("(")),
                  Expanded(
                      flex: 1,
                      child: buildModalBottomTextButton(")")),
                  Expanded(
                      flex: 1,
                      child: buildModalBottomTextButton("v")),
                ],
              )
            ],
          ),
      ),
    )
 //      onClosing: () { setState(() {print("closed");
 //   moveInput=false;
 //
 // });
 // },),
      
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      backgroundColor: Colors.red,
      body: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Stack(
          children: [
            Positioned(
              top:moveInput?50:150,
              left: 250,
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(

                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: FittedBox(
                        child: Text(
                          userInput,
                          style: const TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    Container(

                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.centerRight,
                      child: FittedBox(
                        child: Text(
                          "$answer",
                          style: const TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ]),
            ),
            Positioned(
              top: moveInput?180:300,
              height: moveInput?250:320,
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: Icon(Icons.delete_forever_rounded, color: Colors.white70,),
                        onPressed: () {
                          setState(() {

                              first = 0;
                              second = 0;
                              userInput='0';
                              answer = 0;


                            // else{
                            //   userInput= userInput.substring(0,userInput.length-1);
                            // }
                          });
                        },
                        // onLongPress: (){
                        //       userInput = '0';
                        //       print(userInput);
                        //       answer=0;
                        // },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                          child: const Text(
                            "C",
                            style: kButtonTextSide,
                          ),
                          onPressed: () {
                            setState(() {
                              userInput = userInput.substring(
                                  0, userInput.length - 1);
                              if (userInput == '') {
                                first = 0;
                                second = 0;
                                userInput='0';
                                answer = 0;
                              } else {}

                              // else{
                              //   userInput= userInput.substring(0,userInput.length-1);
                              // }
                            });
                          },
                      // onLongPress: (){
                      //       userInput = '0';
                      //       print(userInput);
                      //       answer=0;
                      // },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                          child: const Text(
                            "/",
                            style: kButtonTextSide
                          ),
                          onPressed: () {
                            setState(() {
                              option = "/";
                              if (userInput.contains("-") ||
                                  userInput.contains("+") ||
                                  userInput.contains("*") ||
                                  userInput.contains("/") ||
                                  userInput.contains("%") ||
                                  userInput.contains("sqrt(") ||
                                  userInput.contains("sin(") ||
                                  userInput.contains("cos(") ||
                                  userInput.contains("tan(") ||
                                  userInput.contains("log(") ||
                                  userInput.contains("ln(") ||
                                  userInput.contains("!(") ||
                                  userInput.contains("^")) {

                                if (second == 0) {
                                  // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));
                                  // answer = answer + sum;

                                  userInput = userInput + '/';
                                  index = userInput.length;
                                } else {
                                  first = first / second;
                                  userInput = userInput + '/';
                                  index = userInput.length;

                                  second = 0;
                                }
                              } else {
                                first = double.parse(userInput);
                                // sum = int.parse(userInput);
                                // answer = answer + sum;

                                userInput = userInput + '/';
                                index = userInput.length;
                              }
                              if (second == 0) {
                                answer = 0;
                              } else {
                                answerDouble = first / second;
                              }

                              second = 0;

                            });
                          }),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                          child: const Text(
                            "*",
                            style: kButtonTextSide
                          ),
                          onPressed: () {
                            setState(() {
                              option = "*";
                              if (userInput.contains("-") ||
                                  userInput.contains("+") ||
                                  userInput.contains("*") ||
                                  userInput.contains("/") ||
                                  userInput.contains("%") ||
                                  userInput.contains("sqrt(") ||
                                  userInput.contains("sin(") ||
                                  userInput.contains("cos(") ||
                                  userInput.contains("tan(") ||
                                  userInput.contains("log(") ||
                                  userInput.contains("ln(") ||
                                  userInput.contains("!(") ||
                                  userInput.contains("^")) {

                                if (second == 0) {
                                  // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));
                                  // answer = answer + sum;

                                  userInput = userInput + '*';
                                  index = userInput.length;
                                } else {
                                  first = first * second;
                                  userInput = userInput + '*';
                                  index = userInput.length;

                                  second = 0;
                                }
                              } else {
                                first = double.parse(userInput);
                                // sum = int.parse(userInput);
                                // answer = answer + sum;

                                userInput = userInput + '*';
                                index = userInput.length;
                              }
                              if (second == 0) {
                                answer = answer;
                              } else {
                                answer = first * second.toDouble();
                              }

                              second = 0;

                            });
                          }),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                          child: const Text(
                            "+",
                            style: kButtonTextSide
                          ),
                          onPressed: () {
                            setState(() {

                              option = "+";
                              if (userInput.contains("-") ||
                                  userInput.contains("+") ||
                                  userInput.contains("*") ||
                                  userInput.contains("/") ||
                                  userInput.contains("%") ||
                                  userInput.contains("sqrt(") ||
                                  userInput.contains("sin(") ||
                                  userInput.contains("cos(") ||
                                  userInput.contains("tan(") ||
                                  userInput.contains("log(") ||
                                  userInput.contains("ln(") ||
                                  userInput.contains("!(") ||
                                  userInput.contains("^")) {

                                if (second == 0) {
                                  // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));
                                  // answer = answer + sum;

                                  userInput = userInput + '+';
                                  index = userInput.length;
                                } else {
                                  first = first + second;
                                  userInput = userInput + '+';
                                  index = userInput.length;

                                  second = 0;
                                }
                              } else {
                                first = double.parse(userInput);
                                // sum = int.parse(userInput);
                                // answer = answer + sum;

                                userInput = userInput + '+';
                                index = userInput.length;
                              }
                              answer = first + second.toDouble();
                              second = 0;

                            });
                          }),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                          child: const Text(
                            "-",
                            style: kButtonTextSide
                          ),
                          onPressed: () {
                            setState(() {

                              option = "-";
                              if (userInput.contains("-") ||
                                  userInput.contains("+") ||
                                  userInput.contains("*") ||
                                  userInput.contains("/") ||
                                  userInput.contains("%") ||
                                  userInput.contains("sqrt(") ||
                                  userInput.contains("sin(") ||
                                  userInput.contains("cos(") ||
                                  userInput.contains("tan(") ||
                                  userInput.contains("log(") ||
                                  userInput.contains("ln(") ||
                                  userInput.contains("!(") ||
                                  userInput.contains("^")) {

                                if (second == 0) {
                                  // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));
                                  // answer = answer + sum;

                                  userInput = userInput + '-';
                                  index = userInput.length;
                                } else {
                                  first = first - second;
                                  userInput = userInput + '-';
                                  index = userInput.length;

                                  second = 0;
                                }
                              } else {
                                first = double.parse(userInput);
                                // sum = int.parse(userInput);
                                // answer = answer + sum;

                                userInput = userInput + '-';
                                index = userInput.length;
                              }
                              answer = first - second.toDouble();
                              second = 0;

                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: moveInput?180:300,
              left: 70,
              height: moveInput?260:350,

              // bottom: 30,
              child: Container(
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: buildTextButton("7"),
                              ),
                              Expanded(
                                flex: 1,
                                child: buildTextButton("8")
                              ),
                              Expanded(
                                flex: 1,
                                child: buildTextButton("9"),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: buildTextButton("4"),
                              ),
                              Expanded(
                                flex: 1,
                                child: buildTextButton("5"),
                              ),
                              Expanded(
                                flex: 1,
                                child: buildTextButton("6"),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: buildTextButton("1"),
                              ),
                              Expanded(
                                flex: 1,
                                child: buildTextButton("2"),
                              ),
                              Expanded(
                                flex: 1,
                                child: buildTextButton("3"),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: TextButton(
                                    child: const Text(
                                      ".",
                                      style: TextStyle(
                                          fontSize: 45,
                                          color: Colors.black45),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (userInput == '0') {
                                          userInput = '0.';
                                        } else if (!userInput.contains("+") &&
                                            !userInput.contains("-") &&
                                            !userInput.contains("*") &&
                                            !userInput.contains("/")) {
                                          userInput = userInput + '.';
                                          // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));

                                        } else {
                                          userInput = userInput + '.';
                                          second = double.parse(userInput
                                              .substring(userInput.length -
                                                  (userInput.length -
                                                      index)));

                                        }
                                      });
                                    }),
                              ),
                              Expanded(
                                flex: 1,
                                child: buildTextButton('0'),
                              ),
                              Expanded(
                                flex: 1,
                                child: TextButton(
                                    child: const Text(
                                      "=",
                                      style: TextStyle(
                                          fontSize: 45,
                                          color: Colors.black45),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (option == "+") {
                                          answer = first + second.toDouble();
                                          second = 0;
                                          first = answer;
                                        } else if (option == "-") {
                                          answer = first - second.toDouble();
                                          second = 0;
                                          first = answer;
                                        } else if (option == "*") {
                                          answer = first * second;
                                          second = 0;
                                          first = answer;
                                        } else if (option == "/") {
                                          answerDouble = first / second;

                                          answer = answerDouble;
                                          second = 0;
                                          first = answer;
                                        }
                                        else if (option == "%") {
                                          answerDouble = first * second/100;

                                          answer = answerDouble;
                                          second = 0;
                                          first = answer;
                                        }
                                        else if (option == "sqrt(") {
                                          userInput = userInput+")";

                                          if (userInput.length-index>2){
                                            answerDouble = sqrt(second);
                                          }
                                          else {
                                            answerDouble = sqrt(first);
                                          }
                                          answer = answerDouble;
                                          second = 0;
                                          first = answer;
                                        }
                                        else if (option == "sin(") {
                                          userInput = userInput+")";

                                          if (userInput.length-index>2){
                                            answerDouble = sin(second);
                                          }
                                          else {
                                            answerDouble = sin(first);
                                          }
                                          answer = answerDouble;
                                          second = 0;
                                          first = answer;
                                        }
                                        else if (option == "cos(") {
                                          userInput = userInput+")";

                                          if (userInput.length-index>2){
                                            answerDouble = cos(second);
                                          }
                                          else {
                                            answerDouble = cos(first);
                                          }
                                          answer = answerDouble;
                                          second = 0;
                                          first = answer;
                                        }
                                        else if (option == "tan(") {
                                          userInput = userInput+")";

                                          if (userInput.length-index>2){
                                            answerDouble = tan(second);
                                          }
                                          else {
                                            answerDouble = tan(first);
                                          }
                                          answer = answerDouble;
                                          second = 0;
                                          first = answer;
                                        }
                                        else if (option == "log(") {
                                          userInput = userInput+")";

                                          if (userInput.length-index>2){
                                            answerDouble = logBase(second, 10);
                                          }
                                          else {
                                            answerDouble = logBase(first, 10);
                                          }
                                          answer = answerDouble;
                                          second = 0;
                                          first = answer;
                                        }
                                        else if (option == "ln(") {
                                          userInput = userInput+")";

                                          if (userInput.length-index>2){
                                            answerDouble = logBase(second, eConst);
                                          }
                                          else {
                                            answerDouble = logBase(first, eConst);
                                          }
                                          answer = answerDouble;
                                          second = 0;
                                          first = answer;
                                        }
                                        else if (option == "!(") {
                                          userInput = userInput+")";

                                          if (userInput.length-index>2){
                                            answerInt = factorial(second.toInt());
                                            answerDouble = answerInt.toDouble();
                                          }
                                          else {
                                            answerInt = factorial(first.toInt());
                                            answerDouble = answerInt.toDouble();
                                          }
                                          answer = answerDouble;
                                          second = 0;
                                          first = answer;
                                        }
                                        else if (option == "^") {
                                          // userInput = userInput+")";

                                          if (userInput.length-index>=1){
                                            third = pow(first, second);
                                            answerDouble =third.toDouble();
                                          }
                                          else {
                                            answerDouble=0.1;
                                          }
                                          answer = answerDouble;
                                          second = 0;
                                          first = answer;
                                        }
                                        // answer = first + second;
                                        // print("answer is $answer");
                                      });
                                    }),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 30,
                width: double.infinity,
                color: Colors.black,
                child: IconButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_up_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () {

                    setState(() {
                      moveInput=true;
                      _showSheet();
                    });

                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextButton buildTextButton(String valueButton) {
    return TextButton(
                                    child: Text(
                                      valueButton,
                                      style: const TextStyle(
                                          fontSize: 35,
                                          color: Colors.black45),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (userInput == '0') {
                                          userInput = valueButton;
                                        } else if(userInput.contains("sqrt(0") ) {
                                          userInput="sqrt("+valueButton;
                                          first = double.parse(userInput
                                              .substring(userInput.length -
                                              (userInput.length -
                                                  index)));
                                        }
                                        else if(userInput.contains("sin(0") ) {
                                          userInput="sin("+valueButton;
                                          first = double.parse(userInput
                                              .substring(userInput.length -
                                              (userInput.length -
                                                  index)));
                                        }
                                        else if(userInput.contains("cos(0")) {
                                          userInput="cos("+valueButton;
                                          first = double.parse(userInput
                                              .substring(userInput.length -
                                              (userInput.length -
                                                  index)));
                                        }
                                        else if(userInput.contains("tan(0")) {
                                          userInput="tan("+valueButton;
                                          first = double.parse(userInput
                                              .substring(userInput.length -
                                              (userInput.length -
                                                  index)));
                                        }
                                        else if(userInput.contains("log(0")) {
                                          userInput="log("+valueButton;
                                          first = double.parse(userInput
                                              .substring(userInput.length -
                                              (userInput.length -
                                                  index)));
                                        }
                                        else if(userInput.contains("ln(0")) {
                                          userInput="ln("+valueButton;
                                          first = double.parse(userInput
                                              .substring(userInput.length -
                                              (userInput.length -
                                                  index)));
                                        }
                                        else if(userInput.contains("!(0")) {
                                          userInput="!("+valueButton;
                                          first = double.parse(userInput
                                              .substring(userInput.length -
                                              (userInput.length -
                                                  index)));
                                        }
                                        else if(userInput.contains("0^") || userInput.contains("^0")) {
                                          userInput="Wrong data";
                                          first = double.parse(userInput
                                              .substring(userInput.length -
                                              (userInput.length -
                                                  index)));
                                        }
                                        else if (!userInput.contains("+") &&
                                            !userInput.contains("-") &&
                                            !userInput.contains("*") &&
                                            !userInput.contains("/") &&
                                            !userInput.contains("%") &&
                                            !userInput.contains("sqrt(") &&
                                            !userInput.contains("sin(") &&
                                            !userInput.contains("cos(") &&
                                            !userInput.contains("tan(") &&
                                            !userInput.contains("log(") &&
                                            !userInput.contains("ln(") &&
                                            !userInput.contains("!(") &&
                                            !userInput.contains("^")) {
                                          userInput = userInput + valueButton;
                                          // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));

                                        }
                                        // else if (!userInput.contains("sqrt(")){
                                        //   userInput = userInput + value_button;
                                        //   // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));
                                        //   print("second is $second");
                                        // }
                                        else {
                                          userInput = userInput + valueButton;
                                          second = double.parse(userInput
                                              .substring(userInput.length -
                                                  (userInput.length -
                                                      index)));

                                        }
                                      });
                                    });
  }
  TextButton buildModalBottomTextButton(String valueBottomButton) {
    return TextButton(
        child: Text(
          valueBottomButton,
          style: const TextStyle(
              fontSize: 20,
              color: Colors.white),
        ),
        onPressed: () {
          setState(() {
            if (userInput == '0') {
              userInput = valueBottomButton;
            } else if (!userInput.contains("+") &&
                !userInput.contains("-") &&
                !userInput.contains("*") &&
                !userInput.contains("/")) {
              userInput = userInput + valueBottomButton;
              // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));

            } else {
              userInput = userInput + valueBottomButton;
              second = double.parse(userInput
                  .substring(userInput.length -
                  (userInput.length -
                      index)));

            }
          });
        });
  }
}
