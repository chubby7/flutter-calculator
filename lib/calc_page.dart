import 'package:calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            ]
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
              child: Text('1000 x 2 + 700',
                style: TextStyle(color: Colors.grey, fontSize: 30.0)
                ,),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Text('=',style: kResultTextsyle),
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
                        topRight: Radius.circular(30.0)
                    )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class CustomSwitch extends StatefulWidget {
  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isDark = !isDark;
        });
      },
      child: Container(
        width: 80,
        height: 40,
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.blue.shade700,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children: [
            // Iconsgit add .
            // git commit -m "setup fontawesome package and explored icon options for custom switch"
            // git push
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.light_mode, color: Colors.grey.shade300, size: 28),
               // Icon(Icons.dark_mode, color: Colors.grey, size: 28),
                FaIcon(FontAwesomeIcons.moon, color: Colors.grey.shade300,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}