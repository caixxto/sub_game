import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:submarine/screens/game.dart';
import 'package:submarine/utilits/global_vars.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]).whenComplete(() {
           SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
             SystemUiOverlay.bottom
           ]);
    runApp( const MaterialApp(
      home:  SafeArea(
        child: Scaffold(
            body: MyApp()),
      ),
    )
    );
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void didChangeDependencies() {
    initGame(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/pic/background.png'), fit: BoxFit.cover)),
        child:  const Game());
  }

  void initGame(BuildContext context) {
    GlobalVars.screenWidth = MediaQuery.of(context).size.width;
    GlobalVars.screenHeight = MediaQuery.of(context).size.height;
  }
}
