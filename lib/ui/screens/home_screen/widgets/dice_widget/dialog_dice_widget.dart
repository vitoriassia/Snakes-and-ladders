import 'package:flutter/material.dart';
import 'package:snakes_and_ladders/ui/sharedWidgets/loading_dice.dart';
import 'package:snakes_and_ladders/ui/sharedWidgets/result_dice_widget.dart';

class DialogDice extends StatelessWidget {
  final bool loading;
  final int? resultDiceOne;
  final int? resultDiceTwo;
  DialogDice(this.loading, {this.resultDiceOne, this.resultDiceTwo});
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.1,
          ),
          Center(
              child: loading
                  ? LoadingDice()
                  : ResultDice(resultDiceOne!, resultDiceTwo!)),
        ],
      ),
    );
  }
}
