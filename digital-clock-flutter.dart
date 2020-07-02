import 'dart:async';
import 'package:base_flutter_project/core/constants/text-styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


/// This widget will implement a digital clock for us and it will return a simple TextWIdget in a String 
class DigitalClock extends StatefulWidget {
  
  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  String _timeString;

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "$_timeString",
      style: headingTextStyle.copyWith(
        color: Colors.white,
         fontSize: 30.0),
    );
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat.jm().format(dateTime);
  }

  @override
  void dispose() {
    super.dispose();
    // timer.dispose();
  }
}
