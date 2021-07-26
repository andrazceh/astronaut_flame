import 'dart:math';
import 'package:astronaut_flame/components/asteroid.dart';
import 'package:astronaut_flame/components/astronaut.dart';
import 'package:astronaut_flame/abstract/spawned_component.dart';
import 'package:astronaut_flame/globals/globals.dart';

class SpawnUtil {
  Random rnd;
  SpawnUtil() {
    rnd = Random();
  }
  static bool canSpawnAstronaut() {
    return DateTime.now().millisecondsSinceEpoch -
            GameWorldTime.lastSpawnAstronautTime >
        GameWorldTime.createAstronautTime;
  }

  static bool canSpawnAsteroid() {
    return DateTime.now().millisecondsSinceEpoch -
            GameWorldTime.lastSpawnAsteroidTime >
        GameWorldTime.createAsteroidTime;
  }

  List<SpawnedComponent> spawnAsteroid(List<SpawnedComponent> components) {
    double x = rnd.nextDouble() *
        (GameWorldMeasures.screenSize.width - GameWorldMeasures.unit);
    GameWorldTime.lastSpawnAsteroidTime = DateTime.now().millisecondsSinceEpoch;
    components.add(Asteroid(x, 0 - GameWorldMeasures.asteroidSize.height));
    return components;
  }

  List<SpawnedComponent> spawnAstronaut(List<SpawnedComponent> components) {
    double x = rnd.nextDouble() *
        (GameWorldMeasures.screenSize.width - GameWorldMeasures.unit);
    GameWorldTime.lastSpawnAstronautTime =
        DateTime.now().millisecondsSinceEpoch;
    components.add(Astronaut(x, 0 - GameWorldMeasures.astronautSize.height));
    return components;
  }
}
