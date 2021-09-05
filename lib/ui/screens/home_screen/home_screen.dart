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
    setState(() {
      _turnPlayer = _turnPlayer.id == 1 ? _playerTwo : _playerOne;

      _expandableControllerPlayerOne.value =
          !_expandableControllerPlayerOne.value;
      _expandableControllerPlayerTwo.value =
          !_expandableControllerPlayerTwo.value;
    });

    print("ANDE  -> $result casas");
  }
}
