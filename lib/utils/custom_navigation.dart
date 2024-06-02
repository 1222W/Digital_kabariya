import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

push(context, screen) {
  Navigator.push(
      context, PageTransition(child: screen, type: PageTransitionType.fade));
}

pushReplacement(context, screen) {
  Navigator.pushReplacement(
      context, CupertinoPageRoute(builder: (context) => screen));
}

pushUntil(context, screen) {
  Navigator.pushAndRemoveUntil(context,
      CupertinoPageRoute(builder: (context) => screen), (route) => false);
}

pop(context) {
  Navigator.pop(context);
}
