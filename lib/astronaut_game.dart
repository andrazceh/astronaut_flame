import 'dart:ui';
import 'package:astronaut_flame/components/asteroid.dart';
import 'package:astronaut_flame/components/astronaut.dart';
import 'package:astronaut_flame/abstract/spawned_component.dart';
import 'package:astronaut_flame/components/game_info.dart';
import 'package:astronaut_flame/components/rocket.dart';
import 'package:astronaut_flame/globals/globals.dart';
import 'package:astronaut_flame/utils/spawn_util.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

class AstronautGame extends Game with HorizontalDragDetector {
  List<SpawnedComponent> components;
  Rocket rocket;
  GameInfo infoBar;
  SpawnUtil spawnUtil;

  AstronautGame() {
    initialize();
  }

  void initialize() async {
    spawnUtil = SpawnUtil();
    components = [];

    resize(await Flame.util.initialDimensions());

    rocket = new Rocket(
        GameWorldMeasures.screenSize.width / 2 - GameWorldMeasures.unit,
        GameWorldMeasures.screenSize.height -
            GameWorldMeasures.rocketSize.height);

    infoBar = new GameInfo(rocket);

    components = spawnUtil.spawnAstronaut(components);
    components = spawnUtil.spawnAsteroid(components);
  }

  @override
  void render(Canvas canvas) {
    components
        .forEach((SpawnedComponent component) => component.render(canvas));
    rocket.render(canvas);
    infoBar.render(canvas);
  }

  @override
  void update(double t) {
    if (rocket.health > 0) {
      if (SpawnUtil.canSpawnAsteroid())
        components = spawnUtil.spawnAsteroid(components);

      if (SpawnUtil.canSpawnAstronaut())
        components = spawnUtil.spawnAstronaut(components);

      components.forEach((SpawnedComponent component) {
        if (component is Astronaut) {
          if (component.componentRect.overlaps(rocket.componentRect)) {
            component.isOffScreen = true;
            rocket.astronauts = rocket.astronauts + 1;
            if (!kIsWeb) Flame.audio.play('pick.wav');
          }
        }
        if (component is Asteroid) {
          if (component.componentRect.overlaps(rocket.componentRect)) {
            rocket.health = rocket.health - 1;
            if (!kIsWeb) Flame.audio.play('pick.wav');
          }
        }
        component.update(t);
      });

      components
          .removeWhere((SpawnedComponent component) => component.isOffScreen);
    }
    rocket.update(t);

    infoBar.update(t);
  }

  @override
  void resize(Size size) {
    GameWorldMeasures.screenSize = size;
    GameWorldMeasures.unit = size.width > size.height
        ? GameWorldMeasures.screenSize.height / 14
        : GameWorldMeasures.screenSize.width / 9;

    GameWorldMeasures.astronautSize.width = GameWorldMeasures.unit;
    GameWorldMeasures.astronautSize.height = GameWorldMeasures.unit * 1.0625;
    GameWorldMeasures.asteroidSize.width = GameWorldMeasures.unit * 2.600;
    GameWorldMeasures.asteroidSize.height = GameWorldMeasures.unit * 2.300;
    GameWorldMeasures.rocketSize.width = GameWorldMeasures.unit;
    GameWorldMeasures.rocketSize.height = GameWorldMeasures.unit * 1.375;
  }

  @override
  void onHorizontalDragStart(DragStartDetails d) {
    rocket.rocketX = d.globalPosition.dx - rocket.componentRect.center.dx;
  }

  @override
  void onHorizontalDragUpdate(DragUpdateDetails d) {
    rocket.rocketX = d.globalPosition.dx - rocket.componentRect.center.dx;
  }

  @override
  void onHorizontalDragEnd(DragEndDetails d) {
    rocket.rocketX = 0;
  }
}
