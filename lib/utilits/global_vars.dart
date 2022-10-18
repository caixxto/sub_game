import 'package:flutter/material.dart';
import 'package:submarine/scenes/app_scene.dart';
import 'package:submarine/scenes/game_over_sceen.dart';
import 'package:submarine/scenes/game_scene.dart';
import 'package:submarine/scenes/start_scene.dart';

class GlobalVars {
  static AppScene currentScene = StartScene();
  static double screenWidth = 0;
  static double screenHeight = 0;
  static int scores = 0;
  static int subColor = 0;
}