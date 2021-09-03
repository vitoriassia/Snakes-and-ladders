import 'package:flutter/material.dart';
import 'package:snakes_and_ladders/constants.dart';

class LoadingDice extends StatelessWidget {
  final bool isVisible;
  LoadingDice(this.isVisible);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: isVisible ? 120 : 0,
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(8)),
        child: isVisible
            ? Container(
                child: Image.asset(
                  "assets/loading_dice.gif",
                  width: 80,
                  height: 80,
                  fit: BoxFit.fill,
                ),
              )
            : Container());
  }
}
