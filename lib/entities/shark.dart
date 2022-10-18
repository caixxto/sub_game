import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:submarine/entities/entity.dart';
import 'package:submarine/utilits/global_vars.dart';

class Shark extends Entity {
  final GlobalKey widgetKey = GlobalKey();

  Shark() : super('shark0', 70) {
    x = GlobalVars.screenWidth;
    y = _getPosition();
  }

  @override
  Widget build() {
    return Positioned(
          key: widgetKey,
          top: y,
          left: x,
          child: sprites.first
    );
  }

  @override
  void move() {
    x -= 5;
    if(x > GlobalVars.screenWidth || y > GlobalVars.screenHeight || x < 0 || y < 0) {
      visible = false;
    }
  }

  double _getPosition() {
    var random = Random();
    int randomNum = random.nextInt(GlobalVars.screenHeight.toInt() - 120);
    return randomNum.toDouble();
  }

}

