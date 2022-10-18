import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:submarine/game_core/main_loop.dart';
import 'package:submarine/scenes/app_scene.dart';
import 'package:submarine/scenes/game_scene.dart';
import 'package:submarine/scenes/start_scene.dart';
import 'package:submarine/utilits/global_vars.dart';

class GameOver extends AppScene {

  @override
  Widget buildScene(context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('GAME OVER'),
            Text('SCORES: ${GlobalVars.scores}'),
            TextButton(
                onPressed: () {
                  GlobalVars.currentScene = GameScene();
                  GlobalVars.currentScene.buildScene(context);
                },
                child: Text('TRY AGAIN'),
            ),
            TextButton(
              onPressed: () {
                GlobalVars.currentScene = StartScene();
                GlobalVars.currentScene.buildScene(context);
              },
              child: Text('MAIN MENU'),
            )
          ],
        ),
      ),
    );
  }

  @override
  void update() {

  }

}