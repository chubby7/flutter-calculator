import 'package:calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:calculator/class/customswitch button.dart';
import 'package:calculator/class/calculator_button.dart';
import 'package:math_expressions/math_expressions.dart' hide Stack;

class CalcPage extends StatefulWidget {
  @override
  State<CalcPage> createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  String input = '';
  String finalResult = '0';
  String equalsButton = '';

  void handleBackspace() {
    if (input.isNotEmpty) {
      input = input.substring(0, input.length - 1);
    } else {
      finalResult = '0';
      equalsButton = '';
    }
  }

  void handleButton(String value) {
    setState(() {
      if (value == 'AC') {
        input = '';
        finalResult = '0';
        equalsButton = '';
      } else if (value == '⌫') {
        handleBackspace();
      } else if (value == '=') {
        finalResult = calculateResult(input);
        equalsButton = '=';
      } else {
        input += value;
      }
      // if(finalResult.length > 8){
      //   finalResult = finalResult.substring(0,6);
      // }
    });
  }

  String calculateResult(String input) {
    try {
      input = input.replaceAll('×', '*');
      input = input.replaceAll('÷', '/');

      ShuntingYardParser p = ShuntingYardParser();
      Expression exp = p.parse(input);

      num eval = RealEvaluator().evaluate(exp);
      double result = eval.toDouble();

      if (result.abs() >= 1e8) {
        // Convert to exponential
        return result
            .toStringAsExponential(3)
            .replaceAll('e+', ' × 10^')
            .replaceAll('e', ' × 10^');
      } else {
        // Normal display
        return result % 1 == 0
            ? result.toInt().toString()
            : result.toStringAsFixed(4);
      }


    } catch (e) {
      return 'Error';
    }
  }

  // Helper method to create the number rows
  Widget buildButtonRow(List<String> chars, Function(String) onButtonTap) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Calc_Button(
              character: chars[0],
              onTap: () => onButtonTap(chars[0]),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Calc_Button(
              character: chars[1],
              onTap: () => onButtonTap(chars[1]),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Calc_Button(
              character: chars[2],
              onTap: () => onButtonTap(chars[2]),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Calc_Button(
              character: chars[3],
              onTap: () => onButtonTap(chars[3]),
            ),
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
            CustomSwitch(),
            SizedBox(height: 100.0),
            Container(
              height: 60.0,
              alignment: Alignment.bottomRight,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Text(
                  input,
                  style: TextStyle(color: Colors.grey, fontSize: 30.0),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Text(equalsButton, style: kResultTextStyle),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    child: Text(finalResult, style: kResultTextStyle),
                  ),
                ),
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
                  ),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
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
                                    color: Color(0xFF123E5C),
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
                                  color: Color(0xFF123E5C),
                                  borderRadius: BorderRadius.circular(1000),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                buildButtonRow(['AC', '⌫', '%', '÷'], (value) {
                                  handleButton(value);
                                }),
                                buildButtonRow(['1', '2', '3', '×'], (value) {
                                  handleButton(value);
                                }),
                                buildButtonRow(['4', '5', '6', '-'], (value) {
                                  handleButton(value);
                                }),
                                buildButtonRow(['7', '8', '9', '+'], (value) {
                                  handleButton(value);
                                }),
                                buildButtonRow(['.', '0', '00', '='], (value) {
                                  handleButton(value);
                                }),
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
