import 'package:calculator/constants.dart';
import 'package:flutter/material.dart';

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
            Switch(value: light, onChanged: (bool value){
              setState(() {
                light = value;
              });
             // TODO 1: WORK ON THIS SWITCH BUTTON, WE WILL BE USING A CUSTOM WIDGET, WE WILL DESIGN OUR OWN SWITCH BUTTON.
            }),
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
