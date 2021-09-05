import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:snakes_and_ladders/models/player_model.dart';
import 'package:snakes_and_ladders/models/position_model.dart';
import 'package:snakes_and_ladders/ui/screens/home_screen/widgets/board_widget.dart';
import 'package:snakes_and_ladders/ui/screens/home_screen/widgets/dice_widget/dice_animation_function.dart';
import 'package:snakes_and_ladders/ui/screens/home_screen/widgets/players_widget/player_card_widget.dart';
import 'package:snakes_and_ladders/ui/sharedWidgets/app_scaffold.dart';
import 'package:snakes_and_ladders/ui/sharedWidgets/sweet_button.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PlayerModel _playerOne =
      PlayerModel(1, "Jogador 1", 0, 0, position: Position(1, 3));
  // PlayerModel _playerOne = PlayerModel(1, "Jogador 1", 0, 0,
  //     position: Position(
  //       316,
  //       203,
  //     ));

  PlayerModel _playerTwo =
      PlayerModel(2, "Jogador 2", 0, 0, position: Position(36, 43));
  late PlayerModel _turnPlayer;

  late ExpandableController _expandableControllerPlayerOne;
  late ExpandableController _expandableControllerPlayerTwo;

  @override
  void initState() {
    _turnPlayer = _playerOne;
    _expandableControllerPlayerOne = ExpandableController();
    _expandableControllerPlayerOne.value = true;
    _expandableControllerPlayerTwo = ExpandableController();
    _expandableControllerPlayerTwo.value = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        buttonFloat: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              BoardWidget(_playerOne, _playerTwo),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PlayerCardWidget(_playerOne, _expandableControllerPlayerOne),
                  SizedBox(width: 10),
                  PlayerCardWidget(_playerTwo, _expandableControllerPlayerTwo),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 15),
                child: SweetButton(
                    text: "Jogar Dados",
                    color: Colors.white,
                    borderColor: Colors.green[800]!,
                    isEnable: true,
                    onPressed: () async {
                      await rollDice();
                    },
                    textcolor: Colors.green[800]!,
                    icon: Icons.casino),
              ),
            ],
          ),
        ));
  }

  rollDice() async {
    int result = await diceAnimationFuntion(context);
    await movePlayerBoard(
        result, _turnPlayer.id == 1 ? _playerOne : _playerTwo);
    setState(() {
      _turnPlayer = _turnPlayer.id == 1 ? _playerTwo : _playerOne;

      _expandableControllerPlayerOne.value =
          !_expandableControllerPlayerOne.value;
      _expandableControllerPlayerTwo.value =
          !_expandableControllerPlayerTwo.value;
    });
  }

  movePlayerBoard(int numberOfMovement, PlayerModel playerModel) async {
    await movePlayerWithDiceRollForward(numberOfMovement, playerModel, false);
    var ladders = laddersMovement(playerModel.position);
    var snakes = runSnakesMovement(playerModel.position);
    if (ladders != 0) {
      await laddersAnimationFunction(context, ladders);
      await movePlayerWithDiceRollForward(ladders, playerModel, true);
    } else if (snakes != 0) {
      await snakesAnimationFunction(context);
      setState(() {
        playerModel.position = snakes;
      });
    }
  }

  Future<void> movePlayerWithDiceRollForward(
      int numberOfMovement, PlayerModel playerModel, bool specialMove) async {
    for (var i = numberOfMovement; i > 0; i--) {
      movePlayerForward(playerModel);
      if (!specialMove) await Future.delayed(Duration(milliseconds: 600));
    }
  }

  void movePlayerForward(PlayerModel playerModel) {
    if (goForward(playerModel.position)) {
      if (goUpLineForward(playerModel.position)) {
        setState(() {
          playerModel.position.bottom += 40;
        });
      } else {
        setState(() {
          playerModel.position.left += 35;
        });
      }
    } else {
      if (goUpLineBack(playerModel.position)) {
        setState(() {
          playerModel.position.bottom += 40;
        });
      } else {
        setState(() {
          playerModel.position.left -= 35;
        });
      }
    }
  }
}

laddersMovement(Position position) {
  // coluna um
  if (position.bottom == 3 && position.left == 36) return 36;
  if (position.bottom == 3 && position.left == 211) return 7;
  if (position.bottom == 3 && position.left == 246) return 23;
  // coluna dois
  if (position.bottom == 43 && position.left == 176) return 11;
  // coluna tres
  if (position.bottom == 83 && position.left == 1) return 21;
  if (position.bottom == 83 && position.left == 246) return 56;
  // coluna quatro
  if (position.bottom == 123 && position.left == 141) return 8;
  //coluna seis
  if (position.bottom == 203 && position.left == 316) return 16;
  // coluna oito
  if (position.bottom == 283 && position.left == 71) return 20;
  if (position.bottom == 283 && position.left == 316) return 20;
  //coluna nove
  if (position.bottom == 323 && position.left == 211) return 7;

  return 0;
}

runSnakesMovement(Position position) {
  // coluna dois
  if (position.bottom == 43 && position.left == 141) return Position(176, 3);
  // coluna 5
  if (position.bottom == 163 && position.left == 176) return Position(141, 83);
  if (position.bottom == 163 && position.left == 281) return Position(316, 43);
  //coluna 7
  if (position.bottom == 243 && position.left == 36) return Position(36, 43);
  if (position.bottom == 243 && position.left == 106) return Position(1, 203);
  //coluna 8
  if (position.bottom == 283 && position.left == 211) return Position(246, 203);
  // coluna 9
  if (position.bottom == 323 && position.left == 281) return Position(246, 243);

  //coluna 10
  if (position.bottom == 363 && position.left == 36) return Position(1, 283);
  if (position.bottom == 363 && position.left == 176) return Position(176, 283);
  if (position.bottom == 363 && position.left == 281) return Position(246, 323);
  return 0;
}

goForward(Position position) {
  return position.bottom != 43 &&
      position.bottom != 123 &&
      position.bottom != 203 &&
      position.bottom != 283 &&
      position.bottom != 363;
}

goUpLineForward(Position position) {
  return position.left == 316 &&
      (position.bottom == 3 ||
          position.bottom == 83 ||
          position.bottom == 163 ||
          position.bottom == 243 ||
          position.bottom == 323);
}

goUpLineBack(Position position) {
  return position.left == 1 &&
      ((position.bottom == 43 ||
          position.bottom == 123 ||
          position.bottom == 203 ||
          position.bottom == 283 ||
          position.bottom == 363));
}
