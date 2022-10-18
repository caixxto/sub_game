import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:submarine/entities/player.dart';
import 'package:submarine/entities/rock.dart';
import 'package:submarine/entities/shark.dart';
import 'package:submarine/scenes/app_scene.dart';
import 'package:submarine/scenes/game_over_sceen.dart';
import 'package:submarine/utilits/global_vars.dart';

class GameScene extends AppScene {
  final Player _player = Player();
  final Shark _shark = Shark();
  double _startGlobalPosition = 0;
  int _scores = 0;
  final List<Shark> _listSharks = [];
  final List<Rock> _listRocks = [];
  final List<Widget> _listWidgets = [];

  @override
  Widget buildScene(context) {
    _countScores();
    _createSprites();
    return Stack(
      children: [
        _player.build(),
        Positioned(top: 20, left: 20, child: Text('SCORES: $_scores')),
        Positioned(
            top: 0,
            left: GlobalVars.screenWidth - GlobalVars.screenWidth / 2,
            child: Container(
              width: GlobalVars.screenWidth / 2,
              height: GlobalVars.screenHeight / 2,
              child: GestureDetector(
                onPanStart: _onPanStart,
                onPanUpdate: _onPanUpdate,
                //onTap: _onTapUp,
              ),
            )),
        Positioned(
            top: GlobalVars.screenHeight - GlobalVars.screenHeight / 2,
            left: GlobalVars.screenWidth - GlobalVars.screenWidth / 2,
            child: Container(
              width: GlobalVars.screenWidth / 2,
              height: GlobalVars.screenHeight / 2,
              child: GestureDetector(
                onPanStart: _onPanStart,
                onPanUpdate: _onPanUpdate,
                //onTap: _onTapDown,
              ),
            )),
        Stack(
          children: _listWidgets,
        )
      ],
    );
  }

  @override
  void update() {

    _player.update();
    Rect playerRect = _player.createRect(_player, _player.widgetKey);
    Rect sharkRect = _listSharks.first.createRect(_listSharks.first, _listSharks.first.widgetKey);
    Rect rockRect = _listRocks.first.createRect(_listRocks.first, _listRocks.first.widgetKey);

    _listWidgets.clear();
    _listSharks.removeWhere((element) => !element.visible);
    _listRocks.removeWhere((element) => !element.visible);

    _listSharks.forEach((element) {
      _listWidgets.add(element.build());
      element.update();
    });

    _listRocks.forEach((element) {
      _listWidgets.add(element.build());
      element.update();
    });

    if (checkItemsCollision(playerRect, sharkRect) || checkItemsCollision(playerRect, rockRect)) {
      _gameOver();
    }

  }

  void _countScores() {
    _scores++;
  }

  void _onPanStart(DragStartDetails details) {
    _startGlobalPosition = details.globalPosition.dy;
  }

  void _onPanUpdate(DragUpdateDetails details) {
    double updateGlobalPosition = details.globalPosition.dy;
    if (updateGlobalPosition > _startGlobalPosition + 30) {
      _player.isMoveDown = true;
      _player.isRotateDown = true;
    }

    if (updateGlobalPosition < _startGlobalPosition + 30) {
      _player.isMoveUp = true;
      _player.isRotateUp = true;
    }
  }

  void _createSprites() {
    if (_listSharks.isEmpty) {
      _listSharks.add(Shark());
    } else {
      return;
    }

    if (_listRocks.isEmpty) {
      _listRocks.add(Rock());
    } else {
      return;
    }
  }

  void _gameOver() {
    GlobalVars.scores = _scores;
    GlobalVars.currentScene = GameOver();
  }

  bool checkItemsCollision(Rect item1, Rect item2){
    var intersectedRect = item1.intersect(item2);
    return intersectedRect.width > 0 && intersectedRect.height > 0;
  }

  // void _onTapDown() {
  //   _player.isMoveDown = true;
  // }
  //
  // void _onTapUp() {
  //   _player.isMoveUp = true;
  // }

}
