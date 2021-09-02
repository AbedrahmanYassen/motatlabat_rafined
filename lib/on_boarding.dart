import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motatlabat/dashboard.dart';
import 'package:motatlabat/universities_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'resources.dart';
import 'dart:async';

class IconMovingAnimation extends StatefulWidget {
  const IconMovingAnimation({Key key}) : super(key: key);
  @override
  _IconMovingAnimationState createState() => _IconMovingAnimationState();
}

class _IconMovingAnimationState extends State<IconMovingAnimation>
    with TickerProviderStateMixin {
  double _opacity = 0.0;
  @override
  void initState() {
    super.initState();
    // _updateSeen();
    startTimer();
    startTimerAppearImad();
  }

  startTimerAppearImad() async {
    Duration duration = new Duration(seconds: 1);
    return Timer(duration, showPicture);
  }

  @override
  void dispose() {
    super.dispose();
  }

  startTimer() async {
    Duration duration = new Duration(seconds: 7);
    return Timer(duration, route);
  }

  showPicture() {
    setState(() {
      _opacity = (_opacity == 0.0) ? 1.0 : 0.0;
    });
  }

  void route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return UniversitiesScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: AnimatedOpacity(
        duration: Duration(seconds: 4),
        opacity: _opacity,
        child: Center(
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage('assets/images/logoOurs.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
