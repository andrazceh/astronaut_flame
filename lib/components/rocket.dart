import 'dart:ui';
import 'dart:core';
import 'package:astronaut_flame/abstract/spawned_component.dart';
import 'package:astronaut_flame/globals/globals.dart';
import 'package:flame/sprite.dart';

class Rocket implements SpawnedComponent {
  @override
  Rect componentRect;
  @override
  Sprite componentSprite;
  @override
  bool isOffScreen = false;

  double rocketX;
  double oldRocketX;
  int health;
  int astronauts;

  Rocket(double x, double y) {
    rocketX = 0;
    oldRocketX = 0;
    health = 100;
    astronauts = 0;
    componentRect = Rect.fromLTWH(x, y, GameWorldMeasures.rocketSize.width,
        GameWorldMeasures.rocketSize.height);
    componentSprite = Sprite("rocket64.png");
  }

  @override
  void render(Canvas c) {
    componentSprite.renderRect(c, componentRect);
  }

  @override
  void update(double t) {
    componentRect =
        componentRect.translate(rocketX * t * GameWorldSpeed.rocketSpeed, 0);
    oldRocketX = rocketX;
    if (componentRect.left <= 0 + GameWorldMeasures.unit) rocketX = 0;
    if (componentRect.right > GameWorldMeasures.unit) rocketX = 0;
    if ((oldRocketX - rocketX).abs() <= 2) rocketX = 0;
  }
}
