import 'package:calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:calculator/class/customswitch button.dart';

class CalcPage extends StatefulWidget {
  @override
  State<CalcPage> createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.4, -0.1),
            colors: [
              Color(0xFF404349),
              Color(0xFF2B2E33),
              Color(0xFF1A1C20),
              Color(0xFF121417),
            ],
          ),
        ),
        padding: EdgeInsets.only(top: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Switch(value: light, onChanged: (bool value){
            //   setState(() {
            //     light = value;
            //   });
            //  // TODO 1: WORK ON THIS SWITCH BUTTON, WE WILL BE USING A CUSTOM WIDGET, WE WILL DESIGN OUR OWN SWITCH BUTTON.
            // }),
            CustomSwitch(),
            SizedBox(height: 100.0),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '1000 x 2 + 700',
                style: TextStyle(color: Colors.grey, fontSize: 30.0),
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Text('=', style: kResultTextsyle),
                ),
                Text('2700', style: kResultTextsyle),
              ],
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 60.0,
                            width: 250.0,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade900,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('AC'),
                                Text('+/-'),
                                Text('%'),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Calc_Button(
                                character: '1',
                              ),
                              SizedBox(width: 20,),
                              Calc_Button(
                                character: '2',
                              ),
                              SizedBox(width: 20,),
                              Calc_Button(
                                character: '3',
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Calc_Button(
                                character: '4',
                              ),
                              SizedBox(width: 20,),
                              Calc_Button(
                                character: '5',
                              ),
                              SizedBox(width: 20,),
                              Calc_Button(
                                character: '6',
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Calc_Button(
                                character: '7',
                              ),
                              SizedBox(width: 20,),
                              Calc_Button(
                                character: '8',
                              ),
                              SizedBox(width: 20,),
                              Calc_Button(
                                character: '9',
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Calc_Button(
                                character: '.',
                              ),
                              SizedBox(width: 20,),
                              Calc_Button(
                                character: '0',
                              ),
                              SizedBox(width: 20,),
                              Calc_Button(
                                character: '00',
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: 20,),
                      Container(
                        height: 250.0,
                        width: 75.0,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade900,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('/'),
                            Text('x'),
                            Text('-'),
                            Text('+'),
                            Text('='),

                          ],
                        ),
                      ),
                    ],

                  ),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Calc_Button extends StatelessWidget {
   Calc_Button({
    super.key, required this.character
  });

  String character;

  @override
  Widget build(BuildContext context) {
    return Container(
       height: 75.0,
       width: 75.0,
      decoration: BoxDecoration(
        color: Colors.blue.shade900,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(child: Text(character)),
    );
  }
}


