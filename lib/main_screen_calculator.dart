import 'dart:math';

import 'package:calculator_test/constants.dart';
import 'package:flutter/material.dart';
const double pi = 3.1415926535897932;
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
  double answer_double = 0;
  double answer = 0;
  String third ="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      body: Stack(
        children: [
          Container(
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: FittedBox(
                        child: Text(
                          userInput,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.centerRight,
                      child: FittedBox(
                        child: Text(
                          "$answer",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 310, left: 8, bottom: 30),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextButton(
                          child: Text(
                            "C",
                            style: TextStyle(
                                fontSize: 45, color: Colors.white70),
                          ),
                          onPressed: () {
                            setState(() {
                              userInput = userInput.substring(
                                  0, userInput.length - 1);
                              if (userInput == '') {
                                answer = 0;
                              } else {}
                              print(userInput);
                              print(answer);
                              // else{
                              //   userInput= userInput.substring(0,userInput.length-1);
                              // }
                            });
                          }),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                          child: Text(
                            "/",
                            style: TextStyle(
                                fontSize: 45, color: Colors.white70),
                          ),
                          onPressed: () {
                            setState(() {
                              option = "/";
                              if (userInput.contains("-") ||
                                  userInput.contains("+") ||
                                  userInput.contains("*") ||
                                  userInput.contains("/") ||
                                  userInput.contains("%") ||
                                  userInput.contains("sqrt(")) {
                                print("contains /");
                                if (second == 0) {
                                  // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));
                                  // answer = answer + sum;
                                  print("second divide is $second");
                                  userInput = userInput + '/';
                                  index = userInput.length;
                                } else {
                                  first = first / second;
                                  userInput = userInput + '/';
                                  index = userInput.length;
                                  print("first multiple is $first");
                                  second = 0;
                                }
                              } else {
                                first = double.parse(userInput);
                                // sum = int.parse(userInput);
                                // answer = answer + sum;
                                print("first multiple is $first");
                                userInput = userInput + '/';
                                index = userInput.length;
                              }
                              if (second == 0) {
                                answer = 0;
                              } else {
                                answer_double = first / second;
                              }

                              second = 0;
                              print("second multiple is $second");
                              print("answer multiple is $answer_double");
                              print("index multiple is $index");
                            });
                          }),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                          child: Text(
                            "*",
                            style: TextStyle(
                                fontSize: 45, color: Colors.white70),
                          ),
                          onPressed: () {
                            setState(() {
                              option = "*";
                              if (userInput.contains("-") ||
                                  userInput.contains("+") ||
                                  userInput.contains("*") ||
                                  userInput.contains("/") ||
                                  userInput.contains("%") ||
                                  userInput.contains("sqrt(")) {
                                print("contains *");
                                if (second == 0) {
                                  // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));
                                  // answer = answer + sum;
                                  print("second multiple is $second");
                                  userInput = userInput + '*';
                                  index = userInput.length;
                                } else {
                                  first = first * second;
                                  userInput = userInput + '*';
                                  index = userInput.length;
                                  print("first multiple is $first");
                                  second = 0;
                                }
                              } else {
                                first = double.parse(userInput);
                                // sum = int.parse(userInput);
                                // answer = answer + sum;
                                print("first multiple is $first");
                                userInput = userInput + '*';
                                index = userInput.length;
                              }
                              if (second == 0) {
                                answer = answer;
                              } else {
                                answer = first * second.toDouble();
                              }

                              second = 0;
                              print("second multiple is $second");
                              print("answer multiple is $answer");
                              print("index multiple is $index");
                            });
                          }),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                          child: Text(
                            "+",
                            style: TextStyle(
                                fontSize: 45, color: Colors.white70),
                          ),
                          onPressed: () {
                            setState(() {
                              option = "+";
                              if (userInput.contains("+") ||
                                  userInput.contains("-") ||
                                  userInput.contains("*") ||
                                  userInput.contains("/") ||
                                  userInput.contains("%") ||
                                  userInput.contains("sqrt(")) {
                                print("contains +");
                                if (second == 0) {
                                  // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));
                                  // answer = answer + sum;
                                  print("second is $second");
                                  userInput = userInput + '+';
                                  index = userInput.length;
                                } else {
                                  first = first + second;
                                  userInput = userInput + '+';
                                  index = userInput.length;
                                  print("first is $first");
                                  second = 0;
                                }
                              } else {
                                first = double.parse(userInput);
                                // sum = int.parse(userInput);
                                // answer = answer + sum;
                                print("first is $first");
                                userInput = userInput + '+';
                                index = userInput.length;
                              }
                              answer = first + second.toDouble();
                              second = 0;
                              print("second is $second");
                              print("answer is $answer");
                              print("index is $index");
                            });
                          }),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                          child: Text(
                            "-",
                            style: TextStyle(
                                fontSize: 45, color: Colors.white70),
                          ),
                          onPressed: () {
                            setState(() {
                              option = "-";
                              if (userInput.contains("-") ||
                                  userInput.contains("+") ||
                                  userInput.contains("*") ||
                                  userInput.contains("/") ||
                                  userInput.contains("%") ||
                                  userInput.contains("sqrt(")) {
                                print("contains -");
                                if (second == 0) {
                                  // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));
                                  // answer = answer + sum;
                                  print("second minus is $second");
                                  userInput = userInput + '-';
                                  index = userInput.length;
                                } else {
                                  first = first - second;
                                  userInput = userInput + '-';
                                  index = userInput.length;
                                  print("first minus is $first");
                                  second = 0;
                                }
                              } else {
                                first = double.parse(userInput);
                                // sum = int.parse(userInput);
                                // answer = answer + sum;
                                print("first minus is $first");
                                userInput = userInput + '-';
                                index = userInput.length;
                              }
                              answer = first - second.toDouble();
                              second = 0;
                              print("second minus is $second");
                              print("answer minus is $answer");
                              print("index minus is $index");
                            });
                          }),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80, top: 300, bottom: 30),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
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
                                      child: Text(
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
                                            print("second is $second");
                                          } else {
                                            userInput = userInput + '.';
                                            second = double.parse(userInput
                                                .substring(userInput.length -
                                                    (userInput.length -
                                                        index)));
                                            print("second is $second");
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
                                      child: Text(
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
                                            answer_double = first / second;

                                            answer = answer_double;
                                            second = 0;
                                            first = answer;
                                          }
                                          else if (option == "%") {
                                            answer_double = first * second/100;

                                            answer = answer_double;
                                            second = 0;
                                            first = answer;
                                          }
                                          else if (option == "sqrt(") {
                                            userInput = userInput+")";
                                            print(userInput.length);
                                            print(index);
                                            print(userInput.length-index>2);
                                            if (userInput.length-index>2){
                                              answer_double = sqrt(second);
                                            }
                                            else {
                                              answer_double = sqrt(first);
                                            }
                                            answer = answer_double;
                                            second = 0;
                                            first = answer;
                                          }
                                          else if (option == "sin(") {
                                            userInput = userInput+")";
                                            print(userInput.length);
                                            print(index);
                                            print(userInput.length-index>=2);
                                            print(first);
                                            if (userInput.length-index>2){
                                              answer_double = second*0.017;
                                            }
                                            else {
                                              answer_double = first*0.017;
                                            }
                                            answer = answer_double;
                                            second = 0;
                                            first = answer;
                                          }
                                          else if (option == "cos(") {
                                            userInput = userInput+")";
                                            print(userInput.length);
                                            print(index);
                                            print(userInput.length-index>=2);
                                            print(second);
                                            if (userInput.length-index>2){
                                              answer_double = second*pi/180;
                                            }
                                            else {
                                              answer_double = first*pi/180;
                                            }
                                            answer = answer_double;
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
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 30,
              width: double.infinity,
              color: Colors.black,
              child: IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_up_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    enableDrag: true,
                      // shape: const RoundedRectangleBorder(
                      //     borderRadius:
                      //     BorderRadius.vertical(top: Radius.circular(25.0))
                      // ),
                      backgroundColor: Colors.black,
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => Padding(
                        padding: EdgeInsets.only(top: 20,  right: 20,  left: 20,
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          color: Colors.black,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
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
                                            child: Text(
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
                                                    userInput.contains("/")||
                                                    userInput.contains("%")) {
                                                  print("contains %");
                                                  if (second == 0) {
                                                    // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));
                                                    // answer = answer + sum;
                                                    print("second divide% is $second");
                                                    userInput = userInput + '%';
                                                    index = userInput.length;
                                                  } else {
                                                    first = first * second/100;
                                                    userInput = userInput + '%';
                                                    index = userInput.length;
                                                    print("first divide% is $first");
                                                    second = 0;
                                                  }
                                                } else {
                                                  first = double.parse(userInput);
                                                  // sum = int.parse(userInput);
                                                  // answer = answer + sum;
                                                  print("first diviDe% is $first");
                                                  userInput = userInput + '%';
                                                  index = userInput.length;
                                                }
                                                if (second == 0) {
                                                  answer = 0;
                                                } else {
                                                  answer_double = first * second/100;
                                                }

                                                second = 0;
                                                print("second multiple is $second");
                                                print("answer multiple is $answer_double");
                                                print("index multiple is $index");
                                              });
                                            }),),
                                    Expanded(
                                        flex: 1,
                                        child: TextButton(
                                            child: Text(
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
                                                    userInput.contains("sqrt(")) {
                                                  print("contains sqrt");
                                                  index = userInput.length-1;
                                                  if (second == 0) {
                                                    // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));
                                                    // answer = answer + sum;
                                                    print("second sqrt is $second");
                                                    userInput =  'sqrt(' + userInput ;
                                                    index = userInput.length-1;
                                                  } else {
                                                    first = sqrt(first);
                                                    userInput =  'sqrt('+ userInput ;
                                                    index = userInput.length;
                                                    print("first divide% is $first");
                                                    second = 0;
                                                  }
                                                } else {
                                                  first = double.parse(userInput);
                                                  // sum = int.parse(userInput);
                                                  // answer = answer + sum;
                                                  print("first sqrt is $first");
                                                  userInput = 'sqrt('+userInput  ;
                                                  index = userInput.length-1;
                                                }
                                                if (second == 0) {
                                                  answer = 0;
                                                } else {
                                                  answer_double = sqrt(first);
                                                }

                                                second = 0;
                                                print("second multiple is $second");
                                                print("answer multiple is $answer_double");
                                                print("index multiple is $index");
                                              });
                                            }),),
                                  ],
                                ),
                              Row(
                                children: [
                                  Expanded(
                                      flex:1,
                                      child: TextButton(
                                          child: Text(
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
                                                  userInput.contains("sin(")
                                              ) {
                                                print("contains sin");
                                                index = userInput.length-1;
                                                if (second == 0) {
                                                  // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));
                                                  // answer = answer + sum;
                                                  print("second sin( is $second");
                                                  userInput =  'sin(' + userInput ;
                                                  index = userInput.length-1;
                                                } else {
                                                  first = first*0.017;
                                                  userInput =  'sin('+ userInput ;
                                                  index = userInput.length;
                                                  print("first sin is $first");
                                                  second = 0;
                                                }
                                              } else {
                                                first = double.parse(userInput);
                                                // sum = int.parse(userInput);
                                                // answer = answer + sum;
                                                print("first sin is $first");
                                                userInput = 'sin('+userInput  ;
                                                index = userInput.length-1;
                                              }
                                              if (second == 0) {
                                                answer = 0;
                                              } else {
                                                answer_double = first * 0.017;
                                              }

                                              second = 0;
                                              print("second multiple is $second");
                                              print("answer multiple is $answer_double");
                                              print("index multiple is $index");
                                            });
                                          }),),
                                  Expanded(
                                      flex: 1,
                                      child: TextButton(
                                          child: Text(
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
                                                  userInput.contains("cos(")
                                              ) {
                                                print("contains cos");
                                                index = userInput.length-1;
                                                if (second == 0) {
                                                  // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));
                                                  // answer = answer + sum;
                                                  print("second cos( is $second");
                                                  userInput =  'cos(' + userInput ;
                                                  index = userInput.length-1;
                                                } else {
                                                  first = first*pi/180;
                                                  userInput =  'cos('+ userInput ;
                                                  index = userInput.length;
                                                  print("first sin is $first");
                                                  second = 0;
                                                }
                                              } else {
                                                first = double.parse(userInput);
                                                // sum = int.parse(userInput);
                                                // answer = answer + sum;
                                                print("first cos is $first");
                                                userInput = 'cos('+userInput  ;
                                                index = userInput.length-1;
                                              }
                                              if (second == 0) {
                                                answer = 0;
                                              } else {
                                                answer_double = first * pi/180;
                                              }

                                              second = 0;
                                              print("second multiple is $second");
                                              print("answer multiple is $answer_double");
                                              print("index multiple is $index");
                                            });
                                          }),),
                                  Expanded(
                                      flex: 1,
                                      child: buildModalBottomTextButton("tan")),
                                  Expanded(
                                      flex: 1,
                                      child: buildModalBottomTextButton("ln")),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      flex:1,
                                      child: buildModalBottomTextButton("log")),
                                  Expanded(
                                      flex: 1,
                                      child: buildModalBottomTextButton("!")),
                                  Expanded(
                                      flex: 1,
                                      child: buildModalBottomTextButton("Pi")),
                                  Expanded(
                                      flex: 1,
                                      child: buildModalBottomTextButton("e")),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      flex:1,
                                      child: buildModalBottomTextButton("^")),
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
                      ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextButton buildTextButton(String value_button) {
    return TextButton(
                                    child: Text(
                                      value_button,
                                      style: TextStyle(
                                          fontSize: 45,
                                          color: Colors.black45),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (userInput == '0') {
                                          userInput = value_button;
                                        } else if(userInput.contains("sqrt(0") ) {
                                          userInput="sqrt("+value_button;
                                          first = double.parse(userInput
                                              .substring(userInput.length -
                                              (userInput.length -
                                                  index)));
                                        }
                                        else if(userInput.contains("sin(0") ) {
                                          userInput="sin("+value_button;
                                          first = double.parse(userInput
                                              .substring(userInput.length -
                                              (userInput.length -
                                                  index)));
                                        }
                                        else if(userInput.contains("cos(0")) {
                                          userInput="cos("+value_button;
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
                                            !userInput.contains("cos(")) {
                                          userInput = userInput + value_button;
                                          // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));
                                          print("second is $second");
                                        }
                                        // else if (!userInput.contains("sqrt(")){
                                        //   userInput = userInput + value_button;
                                        //   // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));
                                        //   print("second is $second");
                                        // }
                                        else {
                                          userInput = userInput + value_button;
                                          second = double.parse(userInput
                                              .substring(userInput.length -
                                                  (userInput.length -
                                                      index)));
                                          print("second is $second");
                                        }
                                      });
                                    });
  }
  TextButton buildModalBottomTextButton(String value_bottom_button) {
    return TextButton(
        child: Text(
          value_bottom_button,
          style: TextStyle(
              fontSize: 20,
              color: Colors.white),
        ),
        onPressed: () {
          setState(() {
            if (userInput == '0') {
              userInput = value_bottom_button;
            } else if (!userInput.contains("+") &&
                !userInput.contains("-") &&
                !userInput.contains("*") &&
                !userInput.contains("/")) {
              userInput = userInput + value_bottom_button;
              // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));
              print("second is $second");
            } else {
              userInput = userInput + value_bottom_button;
              second = double.parse(userInput
                  .substring(userInput.length -
                  (userInput.length -
                      index)));
              print("second is $second");
            }
          });
        });
  }
}
