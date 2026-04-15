import 'package:calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:calculator/class/customswitch button.dart';
import 'package:flutter/rendering.dart';

class CalcPage extends StatefulWidget {
  @override
  State<CalcPage> createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {

  // Helper method to create the number rows
  Widget buildButtonRow(List<String> chars, Function(String) onButtonTap) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Calc_Button(character: chars[0], onTap: () => onButtonTap(chars[0])),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Calc_Button(character: chars[1], onTap: () => onButtonTap(chars[1])),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Calc_Button(character: chars[2], onTap: () => onButtonTap(chars[2])),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Calc_Button(character: chars[3], onTap: () => onButtonTap(chars[3])),
          ),
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


            // This is the Button container
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.4),
                        offset: Offset(4, 4),
                        blurRadius: 10,
                      ),
                      BoxShadow(
                        color: Colors.white.withValues(alpha: 0.05),
                        offset: Offset(-2, -2),
                        blurRadius: 6,
                      ),
                    ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                 ),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFF2D6F95), // lighter blue
                      Color(0xFF0F2F4F), // darker blue
                    ],
                  )
                ),

                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: LayoutBuilder(
                      builder: (context, constraints){
                        /// worked
                        /// Calculate the size of a single "cell"
                        double cellHeight = constraints.maxHeight / 5;
                        double cellWidth = constraints.maxWidth / 4;

                        double internalPadding = 6.0;

                        return Stack(
                          children: [
                            /// 🔵 TOP PILL (AC row)
                            Positioned(
                              top: 6,
                              left: 6,
                              width: (cellWidth * 3) - (internalPadding * 2),
                              height: cellHeight - (internalPadding * 2),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(1000),
                                  ),
                                ),
                              ),
                            ),
                            /// 🔵 RIGHT PILL (operators)
                            Positioned(
                              top: 12,
                              right: 0.5,
                              bottom: 12,
                              width: cellWidth - (internalPadding * 1.5),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(1000),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                buildButtonRow(['AC', '+/-', '%', '÷'], (value) {print(value);}),
                                buildButtonRow(['1', '2', '3', '×'], (value) {print(value);}),
                                buildButtonRow(['4', '5', '6', '-'], (value) {print(value);}),
                                buildButtonRow(['7', '8', '9', '+'], (value) {print(value);}),
                                buildButtonRow(['.', '0', '00', '='], (value) {print(value);}),
                              ],
                            ),
                          ],
                        );
                      },

                    ),
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
  Calc_Button({super.key, required this.onTap, required this.character});

  final String character;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Color(0xFF123E5C),
            shape: BoxShape.circle,
          ),
          child: Center(child: Text(character, style: kButtonTextStyle)),
        ),
      ),
    );
  }
}
