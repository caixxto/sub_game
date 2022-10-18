import 'package:flutter/cupertino.dart';
import 'package:submarine/entities/entity.dart';
import 'package:submarine/utilits/global_vars.dart';

class Rock extends Entity {
  final GlobalKey widgetKey = GlobalKey();

  Rock() : super('rock0', 50) {
    x = GlobalVars.screenWidth;
    y = 50;
  }

  @override
  Widget build() {
    return Positioned(
        key: widgetKey,
        top: GlobalVars.screenHeight - 50,
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
}