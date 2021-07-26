import 'package:astronaut_flame/astronaut_game.dart';
import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:flame/flame.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Util flameUtil = Util();
  if (!kIsWeb) {
    await flameUtil.fullScreen();
    await flameUtil.setOrientation(DeviceOrientation.portraitUp);
  }
  Flame.images.loadAll(<String>[
    'asteroid92.png',
    'rocket64.png',
    'astronaut48.png',
  ]);

  AstronautGame game = AstronautGame();

  runApp(game.widget);
}
