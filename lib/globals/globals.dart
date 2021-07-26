import 'package:flutter/material.dart';

class ComponentSize {
  double width;
  double height;
}

class GameWorldTime {
  static int lastSpawnAsteroidTime;
  static int createAsteroidTime = 2000;
  static int lastSpawnAstronautTime;
  static int createAstronautTime = 1000;
}

class GameWorldSpeed {
  static double astronautSpeed = 4;
  static double asteroidSpeed = 2;
  static double rocketSpeed = 12;
}

class GameWorldMeasures {
  static Size screenSize;
  static double fontSize = 20.0;
  static FontWeight fontWeight = FontWeight.w500;
  static double unit;
  static ComponentSize rocketSize = ComponentSize();
  static ComponentSize astronautSize = ComponentSize();
  static ComponentSize asteroidSize = ComponentSize();
}
