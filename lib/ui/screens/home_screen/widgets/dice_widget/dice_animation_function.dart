import 'dart:math';

import 'package:snakes_and_ladders/ui/screens/home_screen/widgets/dice_widget/dialog_dice_widget.dart';
import 'package:snakes_and_ladders/utils/dialog_transition.dart';
import 'package:snakes_and_ladders/utils/navigation.dart';

Future<int> diceAnimationFuntion(context) async {
  dialogTransitionScale(context, child: DialogDice(true));
  var randomNumber = new Random();
  await Future.delayed(Duration(seconds: 2));
  navigationBack(context: context);
  int numberOne = randomNumber.nextInt(6);
  int numberTwo = randomNumber.nextInt(6);
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
