import 'package:flutter/material.dart';

import '../constance.dart';

class ToggleSwitch extends StatefulWidget {
  @override
  _ToggleSwitchState createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  bool isSwitched = false;

  void _toggleSwitch(bool value) {
    setState(() {
      isSwitched = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Switch(
        value: isSwitched,
        onChanged: _toggleSwitch,
        activeTrackColor: kactiveTrackColor,
        activeColor: kactiveColor,
        inactiveThumbColor: kinactiveThumbColor,
        inactiveTrackColor: kinactiveTrackColor.withOpacity(0.05),
        trackOutlineColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.pressed)) {
            return kinactiveOutlineColor;
          }
          return kactiveOutlineColor;
        }),
      ),
    );
  }
}