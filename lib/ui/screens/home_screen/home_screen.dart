import 'package:flutter/material.dart';
import 'package:snakes_and_ladders/constants.dart';
import 'package:snakes_and_ladders/ui/screens/home_screen/widgets/board_widget.dart';
import 'package:snakes_and_ladders/ui/screens/home_screen/widgets/dice_widget/dice_widget.dart';
import 'package:snakes_and_ladders/ui/sharedWidgets/app_scaffold.dart';
import 'package:snakes_and_ladders/ui/sharedWidgets/loading_dice.dart';
import 'package:snakes_and_ladders/ui/sharedWidgets/result_dice_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _loadingDice = false;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        functionFloat: () async {
          setState(() {
            _loadingDice = true;
          });
          await Future.delayed(Duration(seconds: 3, milliseconds: 760));
          setState(() {
            _loadingDice = false;
          });
        },
        buttonFloat: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              BoardWidget(),
              Row(
                children: [
                  DiceWidget(_loadingDice),
                ],
              )
            ],
          ),
        ));
  }
}
