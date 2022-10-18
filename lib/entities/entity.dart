import 'package:flutter/cupertino.dart';

abstract class Entity {
  double x = 0;
  double y = 0;
  final String spriteName;
  bool visible = true;
  List sprites = [];
  final double size;

  Entity(this.spriteName, this.size) {
    sprites.add(Image.asset('assets/pic/$spriteName.png', height: size, fit: BoxFit.fill));
  }

  void update() {
    move();
  }

  void move();

  Widget build();

  Offset getOffset(key) {
    final RenderBox? box = key.currentContext?.findRenderObject() as RenderBox?;
    final Offset? position = box?.localToGlobal(Offset.zero);
    if (position != null) {
      return position;
    }
    return Offset(0, 0);
  }

  Size getSize(key) {
    final RenderBox? box = key.currentContext?.findRenderObject() as RenderBox?;
    final Size? size = box?.size;
    if (size != null) {
      return size;
    }
    return Size(0, 0);
  }

  Rect createRect(obj, key) {
    Offset offset = getOffset(key);
    Size size = getSize(key);
    double x = offset.dx;
    double y = offset.dy;
    double h = size.height - 20;
    double w = size.width - 20;
    return Rect.fromLTRB(x, y, x + h, y + w);
  }

}