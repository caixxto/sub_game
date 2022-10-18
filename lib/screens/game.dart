import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:submarine/game_core/main_loop.dart';
import 'package:submarine/scenes/app_scene.dart';
import 'package:submarine/scenes/game_over_sceen.dart';
import 'package:submarine/scenes/game_scene.dart';
import 'package:submarine/scenes/options_scene.dart';
import 'package:submarine/scenes/start_scene.dart';
import 'package:submarine/utilits/global_vars.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {

  final ReceivePort _receivePort = ReceivePort();
  late final Isolate _isolateLoop;

  void _startIsolateLoop() async {
    _isolateLoop = await Isolate.spawn(mainLoop,  _receivePort.sendPort);
    _receivePort.listen((message) {
      final AppScene scene = GlobalVars.currentScene;
      scene.update();

     if (scene is GameScene) {
        setState(() {
        });
      }
      if (scene is StartScene) {
        setState(() {
        });
      }
      if (scene is OptionsScene) {
        setState(() {
        });
      }

     if (scene is GameOver) {
       setState(() {
       });
     }
      setState(() {
      });
    });
  }

  @override
  void initState() {
    _startIsolateLoop();
    super.initState();
  }

  @override
  void dispose() {
    _receivePort.close();
    _isolateLoop.kill();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GlobalVars.currentScene.buildScene(context);
  }
}