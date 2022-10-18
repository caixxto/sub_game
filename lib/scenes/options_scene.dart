import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:submarine/scenes/app_scene.dart';
import 'package:submarine/scenes/start_scene.dart';
import 'package:submarine/utilits/global_vars.dart';

class OptionsScene extends AppScene {

  int subColor = 0;

  @override
  Widget buildScene(context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Image.asset('assets/pic/sub$subColor.png', height: 100,),
            ),
            TextButton(
              onPressed: () {
                if (subColor >= 2) {
                  subColor = 0;
                } else {
                  subColor++;
                }
                GlobalVars.subColor = subColor;
              },
              child: Text('CHANGE COLOR'),
            ),
            TextButton(
              onPressed: () {
                GlobalVars.currentScene = StartScene();
                GlobalVars.currentScene.buildScene(context);
              },
              child: Text('BACK'),
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