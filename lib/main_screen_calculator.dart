import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      body: Stack(
        children: [
          Container(
            color: Colors.red,

          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 310, left: 8, bottom: 30),
                child: Container(
                  child: Column(
                    children: [
                      Expanded(
                        flex:1,
                        child: TextButton(
                            child: Text(
                              "C",
                              style: TextStyle(fontSize: 45, color: Colors.white70),
                            ),
                            onPressed: (){}),
                      ),
                      Expanded(
                        flex:1,
                        child: TextButton(
                            child: Text(
                              "/",
                              style: TextStyle(fontSize: 45, color: Colors.white70),
                            ),
                            onPressed: (){}),
                      ),
                      Expanded(
                        flex:1,
                        child: TextButton(
                            child: Text(
                              "*",
                              style: TextStyle(fontSize: 45, color: Colors.white70),
                            ),
                            onPressed: (){}),
                      ),
                      Expanded(
                        flex:1,
                        child: TextButton(
                            child: Text(
                              "+",
                              style: TextStyle(fontSize: 45, color: Colors.white70),
                            ),
                            onPressed: (){}),
                      ),
                      Expanded(
                        flex:1,
                        child: TextButton(
                            child: Text(
                              "-",
                              style: TextStyle(fontSize: 45, color: Colors.white70),
                            ),
                            onPressed: (){}),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80, top: 300,bottom: 30),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0)
                    ),
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
                                  flex:1,
                                  child: TextButton(
                                      child: Text(
                                        "7",
                                        style: TextStyle(fontSize: 45, color: Colors.black45),
                                      ),
                                      onPressed: (){}),
                                ),
                                Expanded(
                                  flex:1,
                                  child: TextButton(
                                      child: Text(
                                          "8",
                                        style: TextStyle(fontSize: 45, color: Colors.black45),
                                      ),
                                      onPressed: (){}),
                                ),
                                Expanded(
                                  flex:1,
                                  child: TextButton(
                                      child: Text(
                                          "9",
                                        style: TextStyle(fontSize: 45, color: Colors.black45),
                                      ),
                                      onPressed: (){}),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Expanded(
                                  flex:1,
                                  child: TextButton(
                                      child: Text(
                                          "4",
                                        style: TextStyle(fontSize: 45, color: Colors.black45),
                                      ),
                                      onPressed: (){}),
                                ),
                                Expanded(
                                  flex:1,
                                  child: TextButton(
                                      child: Text(
                                          "5",
                                        style: TextStyle(fontSize: 45, color: Colors.black45),
                                      ),
                                      onPressed: (){}),
                                ),
                                Expanded(
                                  flex:1,
                                  child: TextButton(
                                      child: Text(
                                          "6",
                                        style: TextStyle(fontSize: 45, color: Colors.black45),
                                      ),
                                      onPressed: (){}),
                                )

                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Expanded(
                                  flex:1,
                                  child: TextButton(
                                      child: Text(
                                          "1",
                                        style: TextStyle(fontSize: 45, color: Colors.black45),
                                      ),
                                      onPressed: (){}),
                                ),
                                Expanded(
                                  flex:1,
                                  child: TextButton(
                                      child: Text(
                                          "2",
                                        style: TextStyle(fontSize: 45, color: Colors.black45),
                                      ),
                                      onPressed: (){}),
                                ),
                                Expanded(
                                  flex:1,
                                  child: TextButton(
                                      child: Text(
                                          "3",
                                        style: TextStyle(fontSize: 45, color: Colors.black45),
                                      ),
                                      onPressed: (){}),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Expanded(
                                  flex:1,
                                  child: TextButton(
                                      child: Text(
                                          ".",
                                        style: TextStyle(fontSize: 45, color: Colors.black45),
                                      ),
                                      onPressed: (){}),
                                ),
                                Expanded(
                                  flex:1,
                                  child: TextButton(
                                      child: Text(
                                          "0",
                                        style: TextStyle(fontSize: 45, color: Colors.black45),
                                      ),
                                      onPressed: (){}),
                                ),
                                Expanded(
                                  flex:1,
                                  child: TextButton(
                                      child: Text(
                                          "=",
                                        style: TextStyle(fontSize: 45, color: Colors.black45),
                                      ),
                                      onPressed: (){}),
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
                icon: Icon(Icons.keyboard_arrow_up_rounded, color: Colors.white,),
                onPressed: (){

                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
