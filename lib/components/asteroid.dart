import 'dart:ui';
import 'package:astronaut_flame/abstract/spawned_component.dart';
import 'package:astronaut_flame/globals/globals.dart';
import 'package:flame/sprite.dart';

class Asteroid implements SpawnedComponent {
  @override
  Rect componentRect;
  @override
  Sprite componentSprite;
  @override
  bool isOffScreen = false;

  Asteroid(double x, double y) {
    componentSprite = Sprite("asteroid128.png");
    componentRect = Rect.fromLTWH(x, y, GameWorldMeasures.asteroidSize.width,
        GameWorldMeasures.asteroidSize.height);
  }

  @override
  void render(Canvas c) {
    componentSprite.renderRect(c, componentRect);
  }

  @override
  void update(double t) {
    componentRect = componentRect.translate(
        0, GameWorldMeasures.unit * GameWorldSpeed.asteroidSpeed * t);
    if (componentRect.top > GameWorldMeasures.screenSize.height) {
      isOffScreen = true;
    }
  }
}
