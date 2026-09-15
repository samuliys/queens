import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queens/controllers/score_controller.dart';
import 'package:queens/services/score_service.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:queens/screens/start_screen.dart';
import 'dart:ui';

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox("storage");

  Get.put<ScoreService>(ScoreService());
  Get.put<ScoreController>(ScoreController());

  runApp(GameApp());
}

class GameApp extends StatelessWidget {
  const GameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: StartScreen(),
      scrollBehavior: CustomScrollBehavior(),
      transitionDuration: Duration.zero,
      defaultTransition: Transition.noTransition,
    );
  }
}
