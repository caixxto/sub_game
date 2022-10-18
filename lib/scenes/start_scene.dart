import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:submarine/scenes/app_scene.dart';
import 'package:submarine/scenes/game_scene.dart';
import 'package:submarine/scenes/options_scene.dart';
import 'package:submarine/utilits/global_vars.dart';

class StartScene extends AppScene {
  @override
  Widget buildScene(context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                GlobalVars.currentScene = GameScene();
                GlobalVars.currentScene.buildScene(context);
              },
              child: Text('PLAY GAME'),
            ),
            TextButton(
              onPressed: () {
                GlobalVars.currentScene = OptionsScene();
                GlobalVars.currentScene.buildScene(context);
              },
              child: Text('OPTIONS'),
            ),
            Text('LAST RECORD: ${GlobalVars.scores}'),
          ],
        ),
      ),
    );
  }

  @override
  void update() {

  }

}