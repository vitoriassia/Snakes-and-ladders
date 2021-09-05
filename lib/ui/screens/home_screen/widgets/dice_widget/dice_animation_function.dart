import 'dart:math';

import 'package:snakes_and_ladders/ui/screens/home_screen/widgets/dice_widget/dialog_dice_widget.dart';
import 'package:snakes_and_ladders/ui/sharedWidgets/climbing_stairs_indicator_widget.dart';
import 'package:snakes_and_ladders/ui/sharedWidgets/snake_indicator_widget.dart';
import 'package:snakes_and_ladders/utils/dialog_transition.dart';
import 'package:snakes_and_ladders/utils/navigation.dart';

Future<int> diceAnimationFuntion(context) async {
  dialogTransitionScale(context, child: DialogDice(true));

  await Future.delayed(Duration(seconds: 3, milliseconds: 0));
  navigationBack(context: context);
  int numberOne = random(1, 7);
  int numberTwo = random(1, 7);
  await dialogTransitionScale(
    context,
    child: DialogDice(
      false,
      resultDiceOne: numberOne,
      resultDiceTwo: numberTwo,
    ),
  );
  return numberOne + numberTwo;
}

random(min, max) {
  var rn = new Random();
  return min + rn.nextInt(max - min);
}

laddersAnimationFunction(context, int numberToUp) async {
  await dialogTransitionScale(
    context,
    child: ClimbingStairsIndicator(numberToUp),
  );
}

snakesAnimationFunction(context) async {
  await dialogTransitionScale(
    context,
    child: SnakeIndicatorWidget(),
  );
}
