import 'package:flutter/material.dart';
import 'package:snakes_and_ladders/constants.dart';

class ResultDice extends StatelessWidget {
  final int resultDiceOne;
  final int resultDiceTwo;
  final bool isVisible;

  ResultDice(this.resultDiceOne, this.resultDiceTwo, this.isVisible);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: isVisible ? 120 : 0,
        child: isVisible
            ? Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Image.asset(
                            "assets/dice$resultDiceOne.png",
                            width: 30,
                            height: 30,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Image.asset(
                            "assets/dice$resultDiceTwo.png",
                            height: 30,
                            width: 30,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: kSecondColor,
                      elevation: 5,
                      child: Container(
                        width: 30,
                        height: 30,
                        child: Center(
                          child: Text(
                            "${resultDiceOne + resultDiceTwo}",
                            style: kAppTitleWhite,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            : Container());
  }
}
