import 'package:flutter/material.dart';
import 'package:snakes_and_ladders/constants.dart';
import 'package:snakes_and_ladders/ui/sharedWidgets/sweet_button.dart';
import 'package:snakes_and_ladders/utils/navigation.dart';

class ResultDice extends StatelessWidget {
  final int resultDiceOne;
  final int resultDiceTwo;

  ResultDice(this.resultDiceOne, this.resultDiceTwo);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "O resultado foi:",
          style: kTitleStyle.copyWith(color: Colors.white, fontSize: 25),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Image.asset(
                "assets/dice$resultDiceOne.png",
                width: 80,
                height: 80,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Image.asset(
                "assets/dice$resultDiceTwo.png",
                width: 80,
                height: 80,
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: Colors.green[600],
          elevation: 5,
          child: Container(
            width: 50,
            height: 50,
            child: Center(
              child: Text(
                "${resultDiceOne + resultDiceTwo}",
                style: kAppTitleWhite.copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Play'),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
          child: SweetButton(
              text: "Andar",
              color: Colors.white,
              borderColor: Colors.green[800]!,
              isEnable: true,
              onPressed: () {
                navigationBack(context: context);
              },
              textcolor: Colors.green[800]!,
              icon: Icons.directions_walk),
        )
      ],
    );
  }
}
