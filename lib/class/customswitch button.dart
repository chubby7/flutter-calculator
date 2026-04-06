import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSwitch extends StatefulWidget {
  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 45,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              blurRadius: 15.0,
              offset: Offset(0, 5)
          )
        ],
        border: Border.all(
          color: Colors.blue.shade900,
        ),
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isDark = false;
                });
              },
              child: SizedBox.expand(
                child: Container(
                  decoration: BoxDecoration(
                    color: isDark ? Colors.transparent : Colors.blue.shade900,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.light_mode_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isDark = true;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isDark ? Colors.blue.shade900 : Colors.transparent,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Center(
                  child: FaIcon(FontAwesomeIcons.moon, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}