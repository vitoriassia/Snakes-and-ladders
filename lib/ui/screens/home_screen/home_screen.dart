import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:snakes_and_ladders/models/player_model.dart';
import 'package:snakes_and_ladders/models/position_model.dart';
import 'package:snakes_and_ladders/ui/screens/home_screen/widgets/board_widget.dart';
import 'package:snakes_and_ladders/ui/screens/home_screen/widgets/dice_widget/dice_animation_function.dart';
import 'package:snakes_and_ladders/ui/screens/home_screen/widgets/players_widget/player_card_widget.dart';
import 'package:snakes_and_ladders/ui/sharedWidgets/app_scaffold.dart';
import 'package:snakes_and_ladders/ui/sharedWidgets/sweet_button.dart';
import 'package:snakes_and_ladders/utils/navigation.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PlayerModel _playerOne =
      PlayerModel(1, "Jogador 1", 0, 1, position: Position(1, 3));

  PlayerModel _playerTwo =
      PlayerModel(2, "Jogador 2", 0, 1, position: Position(1, 3));
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
  void dispose() {
    super.dispose();
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
    setState(() {
      _turnPlayer.id == 2
          ? _playerTwo.numberOfPositionIndicator += result
          : _playerOne.numberOfPositionIndicator += result;
    });
    await movePlayerBoard(
        result, _turnPlayer.id == 1 ? _playerOne : _playerTwo);
    setState(() {
      _turnPlayer = _turnPlayer.id == 1 ? _playerTwo : _playerOne;
      _expandableControllerPlayerOne.value =
          !_expandableControllerPlayerOne.value;
      _expandableControllerPlayerTwo.value =
          !_expandableControllerPlayerTwo.value;
      _turnPlayer.id == 2
          ? _playerTwo.numberOfPlays++
          : _playerOne.numberOfPlays++;
    });
  }

  movePlayerBoard(int numberOfMovement, PlayerModel playerModel) async {
    await movePlayerWithDiceRollForward(numberOfMovement, playerModel, false);
    var ladders = laddersMovement(playerModel.position);
    var snakes = runSnakesMovement(playerModel.position);
    if (ladders != 0) {
      await laddersAnimationFunction(context, ladders);
      await movePlayerWithDiceRollForward(ladders, playerModel, true);
      setState(() {
        playerModel.numberOfPositionIndicator += ladders;
      });
    } else if (snakes.numberOfPosition != 0) {
      await snakesAnimationFunction(context);
      setState(() {
        playerModel.position = snakes;
        playerModel.numberOfPositionIndicator -= snakes.numberOfPosition!;
      });
    }
  }

  Future<void> movePlayerWithDiceRollForward(
      int numberOfMovement, PlayerModel playerModel, bool specialMove) async {
    for (var i = numberOfMovement; i > 0; i--) {
      var continuelooping = movePlayerForward(playerModel);
      if (!specialMove) await Future.delayed(Duration(milliseconds: 600));

      if (!continuelooping) {
        await winnerAnimationFunction(context, playerModel.id);
        navigationTowithAnimationRemoveUtils(
            context: context, page: HomeScreen());
        break;
      }
    }
  }

  bool movePlayerForward(PlayerModel playerModel) {
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
    if (isWinnerPosition(playerModel.position)) {
      return false;
    } else
      return true;
  }

  bool isWinnerPosition(Position position) {
    return position.bottom == 363 && position.left == 1;
  }
}

int laddersMovement(Position position) {
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

Position runSnakesMovement(Position position) {
  // coluna dois
  if (position.bottom == 43 && position.left == 141)
    return Position(176, 3, numberOfPosition: 10);
  // coluna 5
  if (position.bottom == 163 && position.left == 176)
    return Position(141, 83, numberOfPosition: 21);
  if (position.bottom == 163 && position.left == 281)
    return Position(316, 43, numberOfPosition: 38);
  //coluna 7
  if (position.bottom == 243 && position.left == 36)
    return Position(36, 43, numberOfPosition: 43);
  if (position.bottom == 243 && position.left == 106)
    return Position(1, 203, numberOfPosition: 4);
  //coluna 8
  if (position.bottom == 283 && position.left == 211)
    return Position(246, 203, numberOfPosition: 21);
  // coluna 9
  if (position.bottom == 323 && position.left == 281)
    return Position(246, 243, numberOfPosition: 21);
  //coluna 10
  if (position.bottom == 363 && position.left == 36)
    return Position(1, 283, numberOfPosition: 19);
  if (position.bottom == 363 && position.left == 176)
    return Position(176, 283, numberOfPosition: 20);
  if (position.bottom == 363 && position.left == 281)
    return Position(246, 323, numberOfPosition: 4);
  return Position(0, 0, numberOfPosition: 0);
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
