import 'package:snakes_and_ladders/models/position_model.dart';

class PlayerModel {
  int id;
  String name;
  int numberOfPlays;
  int numberOfPositionIndicator = 1;
  Position position;
  PlayerModel(
      this.id, this.name, this.numberOfPlays, this.numberOfPositionIndicator,
      {required this.position});
}
