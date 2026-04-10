import 'package:calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:calculator/class/customswitch button.dart';

class CalcPage extends StatefulWidget {
  @override
  State<CalcPage> createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  bool light = true;

  // Helper method to create the number rows
  Widget buildButtonRow(List<String> chars) {
    return Expanded(
      child: Row(
        children: [
          Expanded(child: Calc_Button(character: chars[0])),
          const SizedBox(width: 10), // The horizontal space you observed
          Expanded(child: Calc_Button(character: chars[1])),
          const SizedBox(width: 10), // The horizontal space you observed
          Expanded(child: Calc_Button(character: chars[2])),
        ],
      ),
    );
  }

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
                  child: Text('=', style: kResultTextStyle),
                ),
                Text('2700', style: kResultTextStyle),
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
                        // Left Side: Top bar + Number Grid
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              // Row 0: AC, +/-, %
                              // Using AspectRatio here keeps these consistent with the circles below
                              AspectRatio(
                                aspectRatio: 3,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade900,
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(child: Center(child: Text('AC', style: kButtonTextStyle))),
                                      Expanded(child: Center(child: Text('+/-', style: kButtonTextStyle))),
                                      Expanded(child: Center(child: Text('%', style: kButtonTextStyle))),
                                    ],
                                  ),
                                ),
                              ),

                              // This is the magic part: Use a Column of Rows instead of a Grid
                              // Expanded forces this section to fill the remaining height exactly
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    buildButtonRow(['1', '2', '3']),
                                    buildButtonRow(['4', '5', '6']),
                                    buildButtonRow(['7', '8', '9']),
                                    buildButtonRow(['.', '0', '00']),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 15), // Spacing between numbers and operators

                        // Right Side: Operator Pillar
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue.shade900,
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(child: Center(child: Text('÷', style: kButtonTextStyle))),
                                Expanded(child: Center(child: Text('×', style: kButtonTextStyle))),
                                Expanded(child: Center(child: Text('-', style: kButtonTextStyle))),
                                Expanded(child: Center(child: Text('+', style: kButtonTextStyle))),
                                Expanded(child: Center(child: Text('=', style: kButtonTextStyle))),
                              ],
                            ),
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
  Calc_Button({super.key, required this.character});

  String character;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blue.shade900,
          shape: BoxShape.circle,
        ),
        child: Center(child: Text(character, style: kButtonTextStyle)),
      ),
    );
  }
}

