import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:submarine/entities/entity.dart';
import 'package:submarine/utilits/global_vars.dart';

class Player extends Entity {
  final GlobalKey widgetKey = GlobalKey();

  Player() : super('sub${GlobalVars.subColor}', 120) {
    x = 50;
    y = 150;
  }

  double _angle = 0;
  double _degree = 0;
  bool isMoveUp = false;
  bool isMoveDown = false;
  bool isRotateUp = false;
  bool isRotateDown = false;

  @override
  Widget build() {
    return Positioned(
        key: widgetKey,
        top: y,
        left: x,
        child: visible ? Transform.rotate(angle: _angle, child: sprites.first) : SizedBox(),
    );
  }

  @override
  void move() {
    if (isMoveUp) y -= 5;
    if (isMoveDown) y += 5;
    if (isRotateUp) _degree -= 5;
    if (isRotateDown) _degree += 5;

    _angle = (_degree * 3.14) / 180;

    isMoveUp = false;
    isMoveDown = false;
    isRotateUp = false;
    isRotateDown = false;

    if (_degree > 15) {
      _degree = 15;
    }

    if (_degree < -15) {
      _degree = -15;
    }

    if (x < 0) {
      x = 0;
    }

    if (y < 0) {
      y = 0;
    }

    if (x > GlobalVars.screenWidth - 50) {
      x = GlobalVars.screenWidth - 50;
    }

    if (y > GlobalVars.screenHeight - 50) {
      y = GlobalVars.screenHeight - 50;
    }

  }

}